// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlslice,Vivado 2016.2" *)
module fft_mag_xlslice_0_0(Din, Dout);
  input [31:0]Din;
  output [15:0]Dout;
endmodule
