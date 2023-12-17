FIRRTL version 1.1.0
circuit Accu :
  module Accu :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_setZero : UInt<1>
    output io_dout : UInt<8>

    reg res : UInt<8>, clock with :
      reset => (UInt<1>("h0"), res) @[Accu.scala 13:20]
    node _res_T = add(res, io_din) @[Accu.scala 14:35]
    node _res_T_1 = tail(_res_T, 1) @[Accu.scala 14:35]
    node _res_T_2 = mux(io_setZero, UInt<1>("h0"), _res_T_1) @[Accu.scala 14:13]
    io_dout <= res @[Accu.scala 17:11]
    res <= mux(reset, UInt<8>("h0"), _res_T_2) @[Accu.scala 13:{20,20} 14:7]
