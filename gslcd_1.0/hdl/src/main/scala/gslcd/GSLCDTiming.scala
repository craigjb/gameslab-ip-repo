package gslcd

import spinal.core._
import spinal.lib._

class GSLCDTiming(
   pixels: Int, lines: Int,
   hSyncStart: Int, hSyncEnd: Int,
   vSyncStart: Int, vSyncEnd: Int,
   hActiveStart: Int, vActiveStart: Int,
   activeWidth: Int
 ) extends Component {

  val io = new Bundle {
    val enable = in Bool
    val vsync  = out Bool
    val hsync = out Bool
    val active = out Bool
    val frameStart = out Bool
    val readEn = out Bool
  }

  val line = Reg(UInt(log2Up(lines) bits)) init(0)
  val pixel = Reg(UInt(log2Up(pixels) bits)) init(0)
  val hSync = RegInit(False)
  val vSync = RegInit(False)
  val active = RegInit(False)
  val readEn = RegInit(False)
  val frameStart = RegInit(False)
  io.frameStart := frameStart
  io.hsync := hSync
  io.vsync := vSync
  io.active := active
  io.readEn := readEn

  when(io.enable) {
    when(pixel === pixels - 1) {
      pixel := 0
      when(line === lines - 1) {
        line := 0
      } otherwise {
        line := line + 1
      }
    } otherwise {
      pixel := pixel + 1
      line := line
    }

    when(pixel >= hSyncStart && pixel < hSyncEnd) {
      hSync := True
    } otherwise {
      hSync := False
    }

    when(line >= vSyncStart && line < vSyncEnd) {
      vSync := True
    } otherwise {
      vSync := False
    }

    when(line >= vActiveStart && pixel >= hActiveStart) {
      active := True
    } otherwise {
      active := False
    }

    when(line >= vActiveStart &&
           pixel >= hActiveStart - 1 &&
           pixel < hActiveStart + activeWidth - 1) {
      readEn := True
    } otherwise {
      readEn := False
    }
    when(line === 0 && pixel === 0) {
      frameStart := True
    } otherwise {
      frameStart := False
    }
  } otherwise {
    pixel := 0
    line := 0
    active := False
    vSync := True
    hSync := False
    readEn := False
    frameStart := False
  }
}
