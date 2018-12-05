// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_1,Vivado 2016.2" *)
module chroma_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty);
  input clk;
  input srst;
  input [383:0]din;
  input wr_en;
  input rd_en;
  output [383:0]dout;
  output full;
  output empty;
endmodule
