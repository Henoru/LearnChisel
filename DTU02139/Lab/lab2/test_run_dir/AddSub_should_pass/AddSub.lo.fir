FIRRTL version 1.1.0
circuit AddSub :
  module AddSub :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<4>
    input io_b : UInt<4>
    input io_selAdd : UInt<1>
    output io_y : UInt<4>

    node _res_T = add(io_a, io_b) @[AddSub.scala 18:20]
    node _res_T_1 = tail(_res_T, 1) @[AddSub.scala 18:20]
    node _res_T_2 = sub(io_a, io_b) @[AddSub.scala 18:24]
    node _res_T_3 = tail(_res_T_2, 1) @[AddSub.scala 18:24]
    node _res_T_4 = mux(io_selAdd, _res_T_1, _res_T_3) @[AddSub.scala 18:11]
    node res = _res_T_4 @[AddSub.scala 14:24 18:6]
    io_y <= res @[AddSub.scala 22:8]
