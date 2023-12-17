circuit CountSevenSeg :
  module SevenSegDecoder :
    input clock : Clock
    input reset : Reset
    output io : { flip sw : UInt<4>, seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7> @[SevenSegDecoder.scala 11:27]
    sevSeg <= UInt<7>("h0") @[SevenSegDecoder.scala 11:27]
    wire num : UInt<7>[16] @[SevenSegDecoder.scala 14:20]
    num[0] <= UInt<7>("h3f") @[SevenSegDecoder.scala 14:20]
    num[1] <= UInt<3>("h6") @[SevenSegDecoder.scala 14:20]
    num[2] <= UInt<7>("h5b") @[SevenSegDecoder.scala 14:20]
    num[3] <= UInt<7>("h4f") @[SevenSegDecoder.scala 14:20]
    num[4] <= UInt<7>("h66") @[SevenSegDecoder.scala 14:20]
    num[5] <= UInt<7>("h6d") @[SevenSegDecoder.scala 14:20]
    num[6] <= UInt<7>("h7d") @[SevenSegDecoder.scala 14:20]
    num[7] <= UInt<3>("h7") @[SevenSegDecoder.scala 14:20]
    num[8] <= UInt<7>("h7f") @[SevenSegDecoder.scala 14:20]
    num[9] <= UInt<7>("h6f") @[SevenSegDecoder.scala 14:20]
    num[10] <= UInt<7>("h77") @[SevenSegDecoder.scala 14:20]
    num[11] <= UInt<7>("h7c") @[SevenSegDecoder.scala 14:20]
    num[12] <= UInt<6>("h39") @[SevenSegDecoder.scala 14:20]
    num[13] <= UInt<7>("h5e") @[SevenSegDecoder.scala 14:20]
    num[14] <= UInt<7>("h79") @[SevenSegDecoder.scala 14:20]
    num[15] <= UInt<7>("h7e") @[SevenSegDecoder.scala 14:20]
    sevSeg <= num[io.sw] @[SevenSegDecoder.scala 18:10]
    node _io_seg_T = not(sevSeg) @[SevenSegDecoder.scala 21:13]
    io.seg <= _io_seg_T @[SevenSegDecoder.scala 21:10]
    io.an <= UInt<4>("he") @[SevenSegDecoder.scala 22:9]

  module CountSevenSeg :
    input clock : Clock
    input reset : UInt<1>
    output io : { seg : UInt<7>, an : UInt<4>}

    wire sevSeg : UInt<7> @[CountSevenSeg.scala 9:27]
    sevSeg <= UInt<7>("h7f") @[CountSevenSeg.scala 9:27]
    reg clk : UInt, clock with :
      reset => (reset, UInt<26>("h2faf080")) @[CountSevenSeg.scala 13:18]
    wire tick : UInt<1> @[CountSevenSeg.scala 14:16]
    tick <= UInt<1>("h0") @[CountSevenSeg.scala 15:7]
    node _clk_T = sub(clk, UInt<1>("h1")) @[CountSevenSeg.scala 16:11]
    node _clk_T_1 = tail(_clk_T, 1) @[CountSevenSeg.scala 16:11]
    clk <= _clk_T_1 @[CountSevenSeg.scala 16:6]
    node _T = eq(clk, UInt<1>("h0")) @[CountSevenSeg.scala 17:11]
    when _T : @[CountSevenSeg.scala 17:18]
      clk <= UInt<26>("h2faf080") @[CountSevenSeg.scala 18:8]
      tick <= UInt<1>("h1") @[CountSevenSeg.scala 19:9]
    reg cnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[CountSevenSeg.scala 22:18]
    node _cnt_T = eq(cnt, UInt<4>("hf")) @[CountSevenSeg.scala 23:24]
    node _cnt_T_1 = add(cnt, UInt<1>("h1")) @[CountSevenSeg.scala 23:39]
    node _cnt_T_2 = tail(_cnt_T_1, 1) @[CountSevenSeg.scala 23:39]
    node _cnt_T_3 = mux(_cnt_T, UInt<1>("h0"), _cnt_T_2) @[CountSevenSeg.scala 23:20]
    node _cnt_T_4 = mux(tick, _cnt_T_3, cnt) @[CountSevenSeg.scala 23:11]
    cnt <= _cnt_T_4 @[CountSevenSeg.scala 23:6]
    inst decoder of SevenSegDecoder @[CountSevenSeg.scala 25:21]
    decoder.clock <= clock
    decoder.reset <= reset
    decoder.io.sw <= cnt @[CountSevenSeg.scala 26:16]
    node _sevSeg_T = not(decoder.io.seg) @[CountSevenSeg.scala 27:13]
    sevSeg <= _sevSeg_T @[CountSevenSeg.scala 27:10]
    node _io_seg_T = not(sevSeg) @[CountSevenSeg.scala 30:13]
    io.seg <= _io_seg_T @[CountSevenSeg.scala 30:10]
    io.an <= UInt<4>("he") @[CountSevenSeg.scala 31:9]

