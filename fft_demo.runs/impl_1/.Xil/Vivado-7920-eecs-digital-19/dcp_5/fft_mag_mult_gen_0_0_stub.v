// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *)
module fft_mag_mult_gen_0_0(CLK, A, B, P);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  output [31:0]P;
endmodule
