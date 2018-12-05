// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_10,Vivado 2016.2" *)
module fft_mag_cordic_0_0(aclk, s_axis_cartesian_tvalid, s_axis_cartesian_tuser, s_axis_cartesian_tlast, s_axis_cartesian_tdata, m_axis_dout_tvalid, m_axis_dout_tuser, m_axis_dout_tlast, m_axis_dout_tdata);
  input aclk;
  input s_axis_cartesian_tvalid;
  input [11:0]s_axis_cartesian_tuser;
  input s_axis_cartesian_tlast;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [11:0]m_axis_dout_tuser;
  output m_axis_dout_tlast;
  output [23:0]m_axis_dout_tdata;
endmodule
