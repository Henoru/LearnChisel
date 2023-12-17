FIRRTL version 1.1.0
circuit Mux2 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _res_T = mux(io_sel, io_b, io_a) @[Mux2.scala 18:13]
    node res = _res_T @[Mux2.scala 14:17 18:7]
    io_y <= res @[Mux2.scala 22:8]
