// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconcat,Vivado 2016.2" *)
module fft_mag_xlconcat_0_0(In0, In1, In2, dout);
  input [2:0]In0;
  input [11:0]In1;
  input [0:0]In2;
  output [15:0]dout;
endmodule
