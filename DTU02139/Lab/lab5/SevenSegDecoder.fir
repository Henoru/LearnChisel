circuit SevenSegDecoder :
  module SevenSegDecoder :
    input clock : Clock
    input reset : UInt<1>
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

