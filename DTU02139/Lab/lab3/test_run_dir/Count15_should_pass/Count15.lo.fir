FIRRTL version 1.1.0
circuit Count15 :
  module Count15 :
    input clock : Clock
    input reset : UInt<1>
    output io_dout : UInt<8>

    reg res : UInt<8>, clock with :
      reset => (UInt<1>("h0"), res) @[Count15.scala 8:20]
    node _res_T = eq(res, UInt<4>("hf")) @[Count15.scala 11:15]
    node _res_T_1 = add(res, UInt<1>("h1")) @[Count15.scala 11:30]
    node _res_T_2 = tail(_res_T_1, 1) @[Count15.scala 11:30]
    node _res_T_3 = mux(_res_T, UInt<1>("h0"), _res_T_2) @[Count15.scala 11:11]
    io_dout <= res @[Count15.scala 14:11]
    res <= mux(reset, UInt<8>("h0"), _res_T_3) @[Count15.scala 8:{20,20} 11:6]
