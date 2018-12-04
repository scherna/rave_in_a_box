// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Tue Dec  4 15:30:45 2018
// Host        : eecs-digital-19 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2016.2" *)
module ila_0(clk, probe0, probe1, probe2, probe3, probe4, probe5)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[15:0],probe2[14:0],probe3[11:0],probe4[15:0],probe5[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [15:0]probe1;
  input [14:0]probe2;
  input [11:0]probe3;
  input [15:0]probe4;
  input [0:0]probe5;
endmodule
