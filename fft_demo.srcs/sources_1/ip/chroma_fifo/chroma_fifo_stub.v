// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Dec  5 18:13:22 2018
// Host        : eecs-digital-19 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo_stub.v
// Design      : chroma_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_1_1,Vivado 2016.2" *)
module chroma_fifo(clk, srst, din, wr_en, rd_en, dout, full, empty, data_count)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[191:0],wr_en,rd_en,dout[191:0],full,empty,data_count[9:0]" */;
  input clk;
  input srst;
  input [191:0]din;
  input wr_en;
  input rd_en;
  output [191:0]dout;
  output full;
  output empty;
  output [9:0]data_count;
endmodule
