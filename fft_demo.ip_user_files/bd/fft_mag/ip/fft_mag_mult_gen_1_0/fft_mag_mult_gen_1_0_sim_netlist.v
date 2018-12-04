// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Nov  1 18:09:42 2018
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_sim_netlist.v
// Design      : fft_mag_mult_gen_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_1_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_1_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_mult_gen_1_0_mult_gen_v12_0_11
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [31:0]P;
  wire [47:0]PCASC;
  wire SCLR;
  wire [1:0]ZERO_DETECT;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_11_viv i_mult
       (.A(A),
        .B(B),
        .CE(CE),
        .CLK(CLK),
        .P(P),
        .PCASC(PCASC),
        .SCLR(SCLR),
        .ZERO_DETECT(ZERO_DETECT));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
gD7l84kB+WAh1ATog3H36h0/cMgn9QL5jGe9p9PjvP7N+FJAVvGVlrxcgBw6dZaWDNZqNANQuRFv
ZSE8fsSCFg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YQUcxim/tlzHeVlJ7otHN7u41KO3Yg5DFb1yF4GCsbXGLtUvWNlkFjY+UPIlgYImR4Zo4dTHJQ+j
3BaUNSUOqAVzT9CfyUelv2YD2ZTfAtzIe1Mboyb3+StKnuzxnZmIhVPiZlowdW5lQ1r7BjDPOsge
ztxOfUTbvYcTUE1ABIE=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
eu4MFD/NMz3pssr62VCh1XDd9mthYydX9VaOq3lWUwHi5/7e5dl2SAWHtYwTnBgGPY+jCcMycJhy
WSlkhQxVj5BsMm2aAItwXFvH2mSbjlPggtI0/+DNGQ4x8LQSFLTDYnnQbBrHlJymsS+/asMkXACD
SJ2tF8LF5tMhAlMPZZ0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rNAzbNlIFUMjdhvgzZ2FokzvR4AuFtV+1AHGDKa9QgeBsZ1e0Fom48uKbJ9iakvqUoUcKKAvRzeY
OBkbx9P7Imx0gvIgzFsgiVw23cBYWOhbhSqVb7mef9aKx8yeF8T48n7gKldUkwBHIPeqaayRI9/Q
HCZO+k2+HCjRZE6L/Gzd+IOdEVUFOg3NtWFPk2JFkfZkxs8X7Vg/xxtvH7uvp+/EbVyiMbnwDT/p
NSqOyA+rJwBJYD3xRIPTFDI83XJLCF+1i4E8hyu7Y0F9MtjKugqEHwAG+JK3jde00nzNNaeLVUQ1
OfFMZJpkk0Cg66d2cvJY/G11oPkmvTq/JZ4+5g==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
apuTRT8aJu0TR7Ciy6ONiGK4AT7TUEiokS4gFf1g+kDg6PdKk9VRun4HKszIadRtahjPQo0of9uS
yvu3GS4EQo+Y+T116wnAIXnZSa8EQaEsDkziOI+rCvXv8IgaPYN8Cq0aRlASFL7IHOWNI49V0c0A
FIG/+5U7ZyNQFCVwuE4gCgK/pA6apm5kY4FGJft/EdZ5YAbR/nCTzK4P53+XsKHrtGfw+/MthFWz
tI0OtloKqc7laKZWKOVFqWq8Qmq7UL6utFODtxEQqzczH+q+Gw4rkUyOosIY+cbB67hX+GlmXXEF
jMwvUcen9t6c+wiH6rmBDcUIiuUHHz6q+jCwJQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dfDj35aI8y6zqcW/IHFxmCDw2mpyex25qQAUnsL+tIRxivv/85PqpCOrf3b7NWnwUKMrsxtw+JBY
mtlPsVxQKR1gn6VkaHwbEgwxXXxFe71Z+1nWQhfF8Nt55jGvq1joWKMrurSV7Mo+HkvHMSszXj3v
8ElD0S6sN91oml0nObejOhxzHf0ybK+sGag+CFA7aBr4k4rYglf7AzOYrPl3nNoCkyrFDQFa46/w
SXJm/os7zUHbsDI5GGUH3BU+NktHZV6GK3iyhtHTwrMgDtpGk6vKHMKULM1Gjv9g1/jp9Ao4cUhr
bCVOXM1v2e8A3564rmh3if78zTzCKamPRAB5Ig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
IVTsWdqSpE5Y++PwEqBSBsuMKVpPzd1sK1mKwNikTNgapYs8Odp4qKmD6tevGrVlgSAshE3KPwg0
XtAv57IpHAZi/o4hRkSVDB4RnJjih2DwsUXyGVO4HBFI5uak/Q3by6eN2EWiz5oUeLhdCELaM9ro
QaPs6JAa8qMMJo7BBwR5/+dJ4LuRCfIgiBnIFSz0IwslaRwOdrycxnsWbN++AdI+Cj02WWfeYELz
yaCbIraUXV49tT46xEftGXhauxM9BEATYIahsfREkP73dqFTp0M3sp3ZVnCtc0CvrBsLNhJpwyYC
zVrdmV0Ido/4jjtwrFddLrtAJwaOUag4TeoECg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
JiCPZLNXxftS09PlGE5D70VAgXQeG9zclOITGHM+TWZfo5tj+yjDyv4FHkkg5fs7MEOel/YV/AOd
6bH7B2exZes6TVII4ri8yrpbfPhGHlizFDnUTmRutxKQsRfEIYT2LvrkraNlA65+rhYGMP3s1FeC
56mZDjjVbkrNvIaTcKJ/EqOwnexZq8WW+RW5sDk1a69TqGUC67Hu7NzyqGH97xGTNDXJ9L2cFvyB
c63oQThgZyoRKSUVi39B7uZs7L9EBkIs/nB9ISrF153v4GxUg6YgebmXUCxL0EbVspuQT0LqAmQB
W1RPOXEd9JZaLUWrUsA3ibC5YBoAWje+TJznfg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
6lLUA9HhPaOPWb8fPE5PtaCZ3FXOOobOsA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
