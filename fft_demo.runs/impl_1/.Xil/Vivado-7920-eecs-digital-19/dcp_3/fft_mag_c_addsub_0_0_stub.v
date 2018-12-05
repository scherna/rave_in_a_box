// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *)
module fft_mag_c_addsub_0_0(A, B, CE, S);
  input [31:0]A;
  input [31:0]B;
  input CE;
  output [31:0]S;
endmodule
