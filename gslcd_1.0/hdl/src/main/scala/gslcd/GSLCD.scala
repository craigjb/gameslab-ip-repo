package gslcd

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite._

class GSLCD(
  axiSlaveAddrWidth: Int, axiSlaveDataWidth: Int,
  pixels: Int, lines: Int,
  hSyncStart: Int, hSyncEnd: Int,
  vSyncStart: Int, vSyncEnd: Int,
  hActiveStart: Int, vActiveStart: Int
) extends Component {

  val io = new Bundle {
    val slaveBus = slave(AxiLite4(AxiLite4Config(axiSlaveAddrWidth, axiSlaveDataWidth)))
    val pclk = in  Bool
    val den = out  Bool
    val vsync  = out Bool
    val hsync = out Bool
    val data = out Bits(24 bits)
  }

  val slaveBusCtrl = new AxiLite4SlaveFactory(io.slaveBus)
  val slaveReg1 = slaveBusCtrl.createReadWrite(Bits(1 bits), 0, 0) init(B"0")
  val enable = slaveReg1(0)

  val pixelClockDomain = ClockDomain.internal("pclk")
  pixelClockDomain.clock := io.pclk
  pixelClockDomain.reset := ResetCtrl.asyncAssertSyncDeassert(
    input = ClockDomain.current.readResetWire,
    clockDomain = pixelClockDomain
  )

  val pixelClockArea = new ClockingArea(pixelClockDomain) {
    val timing = new GSLCDTiming(
      pixels, lines,
      hSyncStart, hSyncEnd,
      vSyncStart, vSyncEnd,
      hActiveStart, vActiveStart
    )
    timing.io.enable := BufferCC(enable)
  }

  io.den := pixelClockArea.timing.io.active
  io.vsync := pixelClockArea.timing.io.vsync
  io.hsync := pixelClockArea.timing.io.hsync

  io.data := B"24'xFF0000"
}

object MyTopLevel {
  def main(args: Array[String]) {
    //SpinalVhdl(new gslcd())
    SpinalVerilog(new GSLCD(32, 32, 928, 525, 40, 88, 13, 16, 128, 45))
  }
}

