FIRRTL version 1.1.0
circuit Mux4 :
  module Mux2 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_sel : UInt<1>
    output io_y : UInt<1>

    node _T = eq(io_sel, UInt<1>("h1")) @[Mux2.scala 17:16]
    node _GEN_0 = mux(_T, io_b, io_a) @[Mux2.scala 17:25 18:10 16:8]
    io_y <= _GEN_0

  module Mux4 :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    input io_c : UInt<1>
    input io_d : UInt<1>
    input io_sel : UInt<2>
    output io_y : UInt<1>

    inst mux0 of Mux2 @[Mux4.scala 18:18]
    inst mux1 of Mux2 @[Mux4.scala 19:18]
    inst mux2 of Mux2 @[Mux4.scala 20:18]
    node _mux0_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 27:22]
    node _mux1_io_sel_T = bits(io_sel, 0, 0) @[Mux4.scala 28:22]
    node _mux2_io_sel_T = bits(io_sel, 1, 1) @[Mux4.scala 29:22]
    io_y <= mux2.io_y @[Mux4.scala 30:7]
    mux0.clock <= clock
    mux0.reset <= reset
    mux0.io_a <= io_a @[Mux4.scala 21:12]
    mux0.io_b <= io_b @[Mux4.scala 22:12]
    mux0.io_sel <= _mux0_io_sel_T @[Mux4.scala 27:14]
    mux1.clock <= clock
    mux1.reset <= reset
    mux1.io_a <= io_c @[Mux4.scala 23:12]
    mux1.io_b <= io_d @[Mux4.scala 24:12]
    mux1.io_sel <= _mux1_io_sel_T @[Mux4.scala 28:14]
    mux2.clock <= clock
    mux2.reset <= reset
    mux2.io_a <= mux0.io_y @[Mux4.scala 25:12]
    mux2.io_b <= mux1.io_y @[Mux4.scala 26:12]
    mux2.io_sel <= _mux2_io_sel_T @[Mux4.scala 29:14]
