package gslcd

import spinal.core._
import spinal.lib._

class gslcd_timing(pixels: Int, lines: Int,
                   hSyncStart: Int, hSyncEnd: Int,
                   vSyncStart: Int, vSyncEnd: Int,
                   hActiveStart: Int, vActiveStart: Int) extends Component {

  val io = new Bundle {
    val vsync  = out Bool
    val hsync = out Bool
    val active = out  Bool
  }

  val line = Reg(UInt(log2Up(lines) bits)) init(0)
  val pixel = Reg(UInt(log2Up(pixels) bits)) init(0)

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
    io.hsync := True
  } otherwise {
    io.hsync := False
  }

  when(line >= vSyncStart && line < vSyncEnd) {
    io.vsync := True
  } otherwise {
    io.vsync := False
  }

  when(line >= vActiveStart && pixel >= hActiveStart) {
    io.active := True
  } otherwise {
    io.active := False
  }
}
