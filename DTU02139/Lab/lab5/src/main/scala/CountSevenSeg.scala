import chisel3._

class CountSevenSeg extends Module {
  val io = IO(new Bundle {
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  val sevSeg = WireDefault("b1111111".U(7.W))

  // *** your code starts here
  // *** CLOCK
  val clk=RegInit(50000000.U)
  val tick=Wire(Bool())
  tick:=0.U
  clk:=clk-1.U
  when(clk===0.U){
    clk:=50000000.U
    tick:=1.U
  }

  val cnt=RegInit(0.U(4.W))
  cnt:=Mux(tick,Mux(cnt===15.U,0.U,cnt+1.U),cnt)
  // connect
  val decoder=Module(new SevenSegDecoder())
  decoder.io.sw:=cnt
  sevSeg := ~(decoder.io.seg)
  // *** your code ends here

  io.seg := ~sevSeg
  io.an := "b1110".U
}

// generate Verilog
object CountSevenSeg extends App {
  emitVerilog(new CountSevenSeg())
}