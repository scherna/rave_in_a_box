// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Nov  1 18:10:03 2018
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_11,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_0_0
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11 U0
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
module fft_mag_mult_gen_0_0_mult_gen_v12_0_11
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_11_viv i_mult
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
bgQYCGDqC67K82quY1y72RnFjwj5Yol900vMlE5LWbkjoVp58x56y9PJjO4PYIC+qNERZ+kVyto7
gnNNQNh2ipwVywdwAlKGE7hr6fKw6ofOFkJIaKv3H/+Cws0ZrMYMR7ZkFyUqc27XEFQHwmDMnLjj
KVSM9s7qFeFHL9zEacnlw3kEYn9P+TzJ7AKCN0O/svmHTDBSCNaIVO3wRiyK2s8/cVojlZabgIZ3
nTqQNR7P/NNpc8IqweCPQZLKV51UPIk8aVNgP71STDLk1AsheupCtkOq8lfpBdKzcB2Lj8cH0PD6
n4TTfgzNd8ZJWmDpvseQTCewNfhHUbsY/h1bcA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
lOPif5R18Od8W9Dcv6ktj1juV7FlQ9hKalKA+CQeWMGIgy6NjncYRAhm2nMQmEDL7JOI5v+iRNgR
ZxOCbtE2F/4FuO2Uo5bmqQUC85UhptDJ4VxbFwVzhrVsHSHjlftOGdoHvsnHKlKjtGwx1cOuv2hA
rWU8ukI/sMaMffpM6n6OTNRpTzJNFYZ3TnHhbetPerUCwneBDdp/+wekqhbxVeFYQkgK739/EVXh
1taUBIyXgR/m2GO6KEhNkLG8M38sfryLDefM2H4k88XnpI+EmO5bVN34drKhAQrs27KZn1d0w8R5
jH4TNrBK/P4bdJyrscwfzaYaLebhYZaylEeWKg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
FU9+eYWIHjpbpKPFJlA+8Y4egWk2eeMTwA==
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
