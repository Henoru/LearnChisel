FIRRTL version 1.1.0
circuit CountSevenSeg :
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

  module CountSevenSeg :
    input clock : Clock
    input reset : UInt<1>
    output io_seg : UInt<7>
    output io_an : UInt<4>

    inst decoder of SevenSegDecoder @[CountSevenSeg.scala 25:21]
    reg clk : UInt<26>, clock with :
      reset => (UInt<1>("h0"), clk) @[CountSevenSeg.scala 13:18]
    node _clk_T = sub(clk, UInt<1>("h1")) @[CountSevenSeg.scala 16:11]
    node _clk_T_1 = tail(_clk_T, 1) @[CountSevenSeg.scala 16:11]
    node _T = eq(clk, UInt<1>("h0")) @[CountSevenSeg.scala 17:11]
    node _GEN_0 = mux(_T, UInt<26>("h2faf080"), _clk_T_1) @[CountSevenSeg.scala 17:18 16:6 18:8]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[CountSevenSeg.scala 17:18 15:7 19:9]
    reg cnt : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cnt) @[CountSevenSeg.scala 22:18]
    node _cnt_T = eq(cnt, UInt<4>("hf")) @[CountSevenSeg.scala 23:24]
    node _cnt_T_1 = add(cnt, UInt<1>("h1")) @[CountSevenSeg.scala 23:39]
    node _cnt_T_2 = tail(_cnt_T_1, 1) @[CountSevenSeg.scala 23:39]
    node _cnt_T_3 = mux(_cnt_T, UInt<1>("h0"), _cnt_T_2) @[CountSevenSeg.scala 23:20]
    node tick = _GEN_1 @[CountSevenSeg.scala 14:16]
    node _cnt_T_4 = mux(tick, _cnt_T_3, cnt) @[CountSevenSeg.scala 23:11]
    node _sevSeg_T = not(decoder.io_seg) @[CountSevenSeg.scala 27:13]
    node sevSeg = _sevSeg_T @[CountSevenSeg.scala 27:10 9:27]
    node _io_seg_T = not(sevSeg) @[CountSevenSeg.scala 30:13]
    io_seg <= _io_seg_T @[CountSevenSeg.scala 30:10]
    io_an <= UInt<4>("he") @[CountSevenSeg.scala 31:9]
    clk <= mux(reset, UInt<26>("h2faf080"), _GEN_0) @[CountSevenSeg.scala 13:{18,18}]
    cnt <= mux(reset, UInt<4>("h0"), _cnt_T_4) @[CountSevenSeg.scala 22:{18,18} 23:6]
    decoder.clock <= clock
    decoder.reset <= reset
    decoder.io_sw <= cnt @[CountSevenSeg.scala 26:16]
