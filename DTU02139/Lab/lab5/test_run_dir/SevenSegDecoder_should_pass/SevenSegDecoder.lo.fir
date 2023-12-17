FIRRTL version 1.1.0
circuit SevenSegDecoder :
  module SevenSegDecoder :
    input clock : Clock
    input reset : UInt<1>
    input io_sw : UInt<4>
    output io_seg : UInt<7>
    output io_an : UInt<4>

    node num_0 = UInt<7>("h3f") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_sw), num_0) @[SevenSegDecoder.scala 18:{10,10}]
    node num_1 = UInt<7>("h6") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_sw), num_1, _GEN_0) @[SevenSegDecoder.scala 18:{10,10}]
    node num_2 = UInt<7>("h5b") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_sw), num_2, _GEN_1) @[SevenSegDecoder.scala 18:{10,10}]
    node num_3 = UInt<7>("h4f") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_sw), num_3, _GEN_2) @[SevenSegDecoder.scala 18:{10,10}]
    node num_4 = UInt<7>("h66") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_sw), num_4, _GEN_3) @[SevenSegDecoder.scala 18:{10,10}]
    node num_5 = UInt<7>("h6d") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_sw), num_5, _GEN_4) @[SevenSegDecoder.scala 18:{10,10}]
    node num_6 = UInt<7>("h7d") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_sw), num_6, _GEN_5) @[SevenSegDecoder.scala 18:{10,10}]
    node num_7 = UInt<7>("h7") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_sw), num_7, _GEN_6) @[SevenSegDecoder.scala 18:{10,10}]
    node num_8 = UInt<7>("h7f") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_sw), num_8, _GEN_7) @[SevenSegDecoder.scala 18:{10,10}]
    node num_9 = UInt<7>("h6f") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_sw), num_9, _GEN_8) @[SevenSegDecoder.scala 18:{10,10}]
    node num_10 = UInt<7>("h77") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_sw), num_10, _GEN_9) @[SevenSegDecoder.scala 18:{10,10}]
    node num_11 = UInt<7>("h7c") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_sw), num_11, _GEN_10) @[SevenSegDecoder.scala 18:{10,10}]
    node num_12 = UInt<7>("h39") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_sw), num_12, _GEN_11) @[SevenSegDecoder.scala 18:{10,10}]
    node num_13 = UInt<7>("h5e") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_sw), num_13, _GEN_12) @[SevenSegDecoder.scala 18:{10,10}]
    node num_14 = UInt<7>("h79") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_sw), num_14, _GEN_13) @[SevenSegDecoder.scala 18:{10,10}]
    node num_15 = UInt<7>("h7e") @[SevenSegDecoder.scala 14:{20,20}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_sw), num_15, _GEN_14) @[SevenSegDecoder.scala 18:{10,10}]
    node _num_io_sw = _GEN_15 @[SevenSegDecoder.scala 18:10]
    node sevSeg = _num_io_sw @[SevenSegDecoder.scala 11:27 18:10]
    node _io_seg_T = not(sevSeg) @[SevenSegDecoder.scala 21:13]
    io_seg <= _io_seg_T @[SevenSegDecoder.scala 21:10]
    io_an <= UInt<4>("he") @[SevenSegDecoder.scala 22:9]
