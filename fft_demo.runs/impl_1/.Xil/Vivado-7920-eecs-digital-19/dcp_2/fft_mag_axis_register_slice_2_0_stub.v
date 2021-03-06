// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_register_slice_v1_1_9_axis_register_slice,Vivado 2016.2" *)
module fft_mag_axis_register_slice_2_0(aclk, aresetn, s_axis_tvalid, s_axis_tdata, s_axis_tlast, s_axis_tuser, m_axis_tvalid, m_axis_tdata, m_axis_tlast, m_axis_tuser);
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  input [31:0]s_axis_tdata;
  input s_axis_tlast;
  input [11:0]s_axis_tuser;
  output m_axis_tvalid;
  output [31:0]m_axis_tdata;
  output m_axis_tlast;
  output [11:0]m_axis_tuser;
endmodule
