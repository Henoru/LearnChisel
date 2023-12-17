import chisel3._

class Count15 extends Module {
  val io = IO(new Bundle {
    val dout = Output(UInt(8.W))
  })

  val res = RegInit(0.U(8.W))

  // ***** your code starts here *****
  res:=Mux(res===15.U,0.U,res+1.U)
  // ***** your code ends here *****

  io.dout := res
}