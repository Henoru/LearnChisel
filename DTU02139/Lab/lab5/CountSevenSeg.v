module SevenSegDecoder(
  input  [3:0] io_sw,
  output [6:0] io_seg
);
  wire [6:0] _GEN_1 = 4'h1 == io_sw ? 7'h6 : 7'h3f; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_2 = 4'h2 == io_sw ? 7'h5b : _GEN_1; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_3 = 4'h3 == io_sw ? 7'h4f : _GEN_2; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_4 = 4'h4 == io_sw ? 7'h66 : _GEN_3; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_5 = 4'h5 == io_sw ? 7'h6d : _GEN_4; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_6 = 4'h6 == io_sw ? 7'h7d : _GEN_5; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_7 = 4'h7 == io_sw ? 7'h7 : _GEN_6; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_8 = 4'h8 == io_sw ? 7'h7f : _GEN_7; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_9 = 4'h9 == io_sw ? 7'h6f : _GEN_8; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_10 = 4'ha == io_sw ? 7'h77 : _GEN_9; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_11 = 4'hb == io_sw ? 7'h7c : _GEN_10; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_12 = 4'hc == io_sw ? 7'h39 : _GEN_11; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_13 = 4'hd == io_sw ? 7'h5e : _GEN_12; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] _GEN_14 = 4'he == io_sw ? 7'h79 : _GEN_13; // @[SevenSegDecoder.scala 18:{10,10}]
  wire [6:0] sevSeg = 4'hf == io_sw ? 7'h7e : _GEN_14; // @[SevenSegDecoder.scala 18:{10,10}]
  assign io_seg = ~sevSeg; // @[SevenSegDecoder.scala 21:13]
endmodule
module CountSevenSeg(
  input        clock,
  input        reset,
  output [6:0] io_seg,
  output [3:0] io_an
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] decoder_io_sw; // @[CountSevenSeg.scala 25:21]
  wire [6:0] decoder_io_seg; // @[CountSevenSeg.scala 25:21]
  reg [25:0] clk; // @[CountSevenSeg.scala 13:18]
  wire [25:0] _clk_T_1 = clk - 26'h1; // @[CountSevenSeg.scala 16:11]
  wire  tick = clk == 26'h0; // @[CountSevenSeg.scala 17:11]
  reg [3:0] cnt; // @[CountSevenSeg.scala 22:18]
  wire [3:0] _cnt_T_2 = cnt + 4'h1; // @[CountSevenSeg.scala 23:39]
  wire [6:0] sevSeg = ~decoder_io_seg; // @[CountSevenSeg.scala 27:13]
  SevenSegDecoder decoder ( // @[CountSevenSeg.scala 25:21]
    .io_sw(decoder_io_sw),
    .io_seg(decoder_io_seg)
  );
  assign io_seg = ~sevSeg; // @[CountSevenSeg.scala 30:13]
  assign io_an = 4'he; // @[CountSevenSeg.scala 31:9]
  assign decoder_io_sw = cnt; // @[CountSevenSeg.scala 26:16]
  always @(posedge clock) begin
    if (reset) begin // @[CountSevenSeg.scala 13:18]
      clk <= 26'h2faf080; // @[CountSevenSeg.scala 13:18]
    end else if (tick) begin // @[CountSevenSeg.scala 17:18]
      clk <= 26'h2faf080; // @[CountSevenSeg.scala 18:8]
    end else begin
      clk <= _clk_T_1; // @[CountSevenSeg.scala 16:6]
    end
    if (reset) begin // @[CountSevenSeg.scala 22:18]
      cnt <= 4'h0; // @[CountSevenSeg.scala 22:18]
    end else if (tick) begin // @[CountSevenSeg.scala 23:11]
      if (cnt == 4'hf) begin // @[CountSevenSeg.scala 23:20]
        cnt <= 4'h0;
      end else begin
        cnt <= _cnt_T_2;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  clk = _RAND_0[25:0];
  _RAND_1 = {1{`RANDOM}};
  cnt = _RAND_1[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
