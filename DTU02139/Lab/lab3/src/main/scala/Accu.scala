import chisel3._

class Accu extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val setZero = Input(Bool())
    val dout = Output(UInt(8.W))
  })


  // ***** your code starts here *****

  val res = RegInit(0.U(8.W))
  res := Mux(io.setZero, 0.U, res + io.din)
  // ***** your code ends here *****

  io.dout := res
}