import chisel3._

class Delay extends Module {
  val io = IO(new Bundle {
    val din = Input(UInt(8.W))
    val dout = Output(UInt(8.W))
  })

  val res = Wire(UInt())

  // ***** your code starts here *****

  // below is dummy code to make this example compile
  val reg1=Reg(UInt(8.W))
  val reg2=Reg(UInt(8.W))
  res:=reg2
  reg2:=reg1
  reg1:=io.din

  // ***** your code ends here *****

  io.dout := res
}