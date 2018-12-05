// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module nexys4_fft_demo(CLK100MHZ, SW, BTNC, BTNU, BTNL, BTNR, BTND, AD3P, AD3N, VGA_R, VGA_B, VGA_G, VGA_HS, VGA_VS, AUD_PWM, AUD_SD, LED16_B, LED16_G, LED16_R, LED17_B, LED17_G, LED17_R, LED, SEG, AN);
  input CLK100MHZ;
  input [15:0]SW;
  input BTNC;
  input BTNU;
  input BTNL;
  input BTNR;
  input BTND;
  input AD3P;
  input AD3N;
  output [3:0]VGA_R;
  output [3:0]VGA_B;
  output [3:0]VGA_G;
  output VGA_HS;
  output VGA_VS;
  output AUD_PWM;
  output AUD_SD;
  output LED16_B;
  output LED16_G;
  output LED16_R;
  output LED17_B;
  output LED17_G;
  output LED17_R;
  output [15:0]LED;
  output [7:0]SEG;
  output [7:0]AN;
endmodule
