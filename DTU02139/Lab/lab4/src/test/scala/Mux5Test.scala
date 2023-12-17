import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import  scala.util.Random
class Mux5Test extends AnyFlatSpec with ChiselScalatestTester {
  "Mux5 " should "pass" in {
    test(new Mux5()) { dut =>
      // write your test here
      object Random extends Random
      val sel=0.U
      for(testRnd <- 1 until 10){
          var numbers=Array(Random.between(0,255),Random.between(0,255),Random.between(0,255),Random.between(0,255),Random.between(0,255))
          dut.io.a.poke(numbers(0).U)
          dut.io.b.poke(numbers(1).U)
          dut.io.c.poke(numbers(2).U)
          dut.io.d.poke(numbers(3).U)
          dut.io.e.poke(numbers(4).U)
          for(ind <- 0 to 4){
            dut.io.sel.poke(ind.U)
            dut.io.y.expect(numbers(ind).U)
          }
      }
    }
  }
}
