package gslcd

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite._
import spinal.lib.bus.amba4.axi._
import spinal.lib.fsm._

object GSLCD {
  val FifoDepth = 1024
  val BurstLength = 64
}

class GSLCD(
  axiSlaveAddrWidth: Int, axiSlaveDataWidth: Int,
  pixels: Int, lines: Int,
  hSyncStart: Int, hSyncEnd: Int,
  vSyncStart: Int, vSyncEnd: Int,
  hActiveStart: Int, vActiveStart: Int,
  activeWidth: Int, activeHeight: Int,
  axiMasterAddrWidth: Int
) extends Component {
  
  import GSLCD._

  val axiMasterConfig = Axi4Config(
    addressWidth = axiMasterAddrWidth,
    dataWidth = 32,
    useId = false,
    useRegion = false
  )

  val io = new Bundle {
    val slaveBus = slave(AxiLite4(AxiLite4Config(axiSlaveAddrWidth, axiSlaveDataWidth)))
    val masterBus = master(Axi4(axiMasterConfig))
    val pclk = in  Bool
    val den = out  Bool
    val vsync  = out Bool
    val hsync = out Bool
    val data = out Bits(24 bits)
  }

  val slaveBusCtrl = new AxiLite4SlaveFactory(io.slaveBus)
  val ctrlReg = slaveBusCtrl.createReadWrite(Bits(1 bits), 0, 0) init(B"0")
  val framePtrReg = slaveBusCtrl.createReadWrite(UInt(32 bits), 0x4, 0) init(0)

  val enable = ctrlReg(0)

  val pixelClockDomain = ClockDomain.internal("pclk")
  pixelClockDomain.clock := io.pclk
  pixelClockDomain.reset := ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.readResetWire,
    clockDomain = pixelClockDomain
  )

  val fifo = new GSLCDFifo(
    depth = FifoDepth,
    pushClock = ClockDomain.current,
    popClock = pixelClockDomain,
    almostFullOffset = BurstLength
  )

  val pixelClockArea = new ClockingArea(pixelClockDomain) {
    val timing = new GSLCDTiming(
      pixels, lines,
      hSyncStart, hSyncEnd,
      vSyncStart, vSyncEnd,
      hActiveStart, vActiveStart,
      activeWidth
    )
    timing.io.enable := BufferCC(enable)

    val widthConverter = new GSLCD32To24()
    widthConverter.io.readEn := timing.io.readEn
    fifo.io.pop >> widthConverter.io.data32

    io.data(7, 0) := widthConverter.io.data24(23, 16)
    io.data(15, 8) := widthConverter.io.data24(15, 8)
    io.data(23, 16) := widthConverter.io.data24(7, 0)
  }

  io.den := pixelClockArea.timing.io.active
  io.vsync := pixelClockArea.timing.io.vsync
  io.hsync := pixelClockArea.timing.io.hsync

  val wordCount = (activeWidth * activeHeight * 3) / 4
  val dma = new GSLCDDMA(
    busConfig = axiMasterConfig,
    burstLength = BurstLength,
    wordCount = wordCount
  )
  dma.io.enable := enable
  dma.io.frameStart := BufferCC(pixelClockArea.timing.io.frameStart)
  dma.io.framePtr := framePtrReg
  dma.io.ar >> io.masterBus.ar
  dma.io.rLast := io.masterBus.r.payload.last
  dma.io.fifoAlmostFull := fifo.io.almostFull

  // connect AXI master read to fifo input
  fifo.io.push.valid := io.masterBus.r.valid
  io.masterBus.r.ready := fifo.io.push.ready
  fifo.io.push.payload := io.masterBus.r.payload.data

  // tie off all write signals
  io.masterBus.aw.valid := False
  io.masterBus.aw.payload.addr := 0
  io.masterBus.aw.payload.len := 0
  io.masterBus.aw.payload.size := 0
  io.masterBus.aw.payload.burst := B"00"
  io.masterBus.aw.payload.lock := B"0"
  io.masterBus.aw.payload.cache := B"0000"
  io.masterBus.aw.payload.qos := B"0000"
  io.masterBus.aw.payload.prot := B"000"
  io.masterBus.w.valid := False
  io.masterBus.w.payload.data := B"32'x0"
  io.masterBus.w.payload.strb := B"0000"
  io.masterBus.w.payload.last := False
  io.masterBus.b.ready := False
}

class GSLCD32To24 extends Component {
  val io = new Bundle {
    val readEn = in Bool
    val data32 = slave Stream(Bits(32 bits))
    val data24 = out Bits(24 bits)
  }

  val temp = Reg(Bits(48 bits)) init(B"48'x0")
  val state = Reg(UInt(2 bits)) init(0)

  io.data32.ready := io.readEn && (state =/= 3)
  io.data24 := temp(23, 0)

  when(io.readEn) {
    switch(state) {
      is(0) {
        when(io.data32.valid) {
          temp(31, 0) := io.data32.payload
          state := 1
        }
      }
      is(1) {
        when(io.data32.valid) {
          temp(7, 0) := temp(31, 24)
          temp(39, 8) := io.data32.payload
          state := 2
        }
      }
      is(2) {
        when(io.data32.valid) {
          temp(15, 0) := temp(39, 24)
          temp(47, 16) := io.data32.payload
          state := 3
        }
      }
      is(3) {
        temp(23, 0) := temp(47, 24)
        state := 0
      }
    }
  }
}

class GSLCDDMA(
  busConfig: Axi4Config,
  burstLength: Int,
  wordCount: Int
) extends Component {

  val io = new Bundle {
    val enable = in Bool
    val frameStart = in Bool
    val framePtr = in UInt(32 bits)
    val ar = master(Stream(Axi4Ar(busConfig)))
    val rLast = in Bool
    val fifoAlmostFull = in Bool
  }

  val addrReg = Reg(UInt(32 bits)) init(0)
  val validReg = Reg(Bool) init(False)

  val fsm = new StateMachine {
    val idle = new State with EntryPoint
    val startRead = new State
    val reading = new State
    val waiting = new State

    val burstCount = wordCount / burstLength
    val counter = Reg(UInt(log2Up(burstCount) + 1 bits)) init(0)
    counter := counter
    addrReg := addrReg
    validReg := False
    
    idle.whenIsActive {
      when(io.frameStart && io.enable) {
        addrReg := io.framePtr
        validReg := True
        goto(startRead)
      } otherwise {
        counter := 0
      }
    }
    startRead.whenIsActive {
      when(io.ar.ready) {
        counter := counter + 1
        goto(reading)
      } otherwise {
        validReg := True
      }
    }
    reading.whenIsActive {
      when(io.rLast) {
        when(counter === burstCount) {
          counter := 0
          goto(idle)
        } otherwise {
          when(io.fifoAlmostFull) {
            goto(waiting)
          } otherwise {
            addrReg := addrReg + (burstLength * 4)
            validReg := True
            goto(startRead)
          }
        }
      }
    }
    waiting.whenIsActive {
      when(!io.fifoAlmostFull) {
        addrReg := addrReg + (burstLength * 4)
        validReg := True
        goto(startRead)
      }
    }
  }

  io.ar.valid := validReg
  io.ar.payload.addr := addrReg
  io.ar.payload.len := burstLength - 1
  io.ar.payload.size := 2
  io.ar.payload.burst := B"01"
  io.ar.payload.lock := B"0"
  io.ar.payload.cache := B"0010"
  io.ar.payload.qos := B"0000"
  io.ar.payload.prot := B"000"
}

class GSLCDFifo(
  depth: Int,
  pushClock: ClockDomain, popClock: ClockDomain,
  almostFullOffset: Int
) extends Component {

  require(depth >= 2)
  require(isPow2(depth))

  val io = new Bundle {
    val push = slave Stream(Bits(32 bits))
    val pop = master Stream(Bits(32 bits))
    val almostFull = out Bool
  }

  val fifo = StreamFifoCC(Bits(32 bits), depth, pushClock, popClock)
  fifo.io.push << io.push
  fifo.io.pop >> io.pop
  io.almostFull := (depth - fifo.io.pushOccupancy) < almostFullOffset
}

object Main {
  def main(args: Array[String]) {
    SpinalVerilog(new GSLCDTiming(
      pixels = 928, lines = 525,
      hSyncStart = 40, hSyncEnd = 88,
      vSyncStart = 13, vSyncEnd = 16,
      hActiveStart = 128, vActiveStart = 45,
      activeWidth = 800
    )).printPruned()
    //SpinalVhdl(new gslcd())
    //SpinalVerilog(new GSLCD(
      //axiSlaveAddrWidth = 32, axiSlaveDataWidth = 32,
      //pixels = 928, lines = 525,
      //hSyncStart = 40, hSyncEnd = 88,
      //vSyncStart = 13, vSyncEnd = 16,
      //hActiveStart = 128, vActiveStart = 45,
      //activeWidth = 800, activeHeight = 480,
      //axiMasterAddrWidth = 32
    //)).printPruned()
  }
}

