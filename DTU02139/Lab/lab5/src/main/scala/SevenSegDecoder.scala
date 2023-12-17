import chisel3._
import chisel3.util._

class SevenSegDecoder extends Module {
  val io = IO(new Bundle {
    val sw = Input(UInt(4.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault(0.U(7.W))

  // ***** your code starts here *****
  val num = VecInit("h3f".U(7.W), "h06".U, "h5b".U, "h4f".U,
    "h66".U, "h6d".U, "h7d".U, "h07".U,
    "h7f".U, "h6f".U, "h77".U, "h7c".U,
    "h39".U, "h5e".U, "h79".U, "h7e".U)
  sevSeg := num(io.sw)
  // ***** your code ends here *****

  io.seg := ~sevSeg
  io.an := "b1110".U
}

// generate Verilog
object SevenSegDecoder extends App {
  emitVerilog(new SevenSegDecoder())
}


