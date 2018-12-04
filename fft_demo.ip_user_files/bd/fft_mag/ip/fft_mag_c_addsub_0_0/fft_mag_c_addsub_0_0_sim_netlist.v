// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Thu Nov  1 18:10:24 2018
// Host        : eecs-digital-03 running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fft_mag_c_addsub_0_0
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire CE;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_9" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_c_addsub_0_0_c_addsub_v12_0_9
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_9_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
oc53MTT5lIJddbypX8Jl72CTaWvpflySff9xFng17lVJfZ+wg49YA/OJjCaam3fL3OVVIeJXePi5
B8znBiPhETV5551E3CBepaR3xLyX1+KjoID/g3RYW0Tdsdp5Xm6RHDqZdPEw+sVweaIz/JlWvBEf
fnaeCA5tUbg5JqBVqTewekwBR8tcmqO/X+FKygQKUSpbrKUv1VuroXHeLKEs2cEDT3yLbOCwhUjB
0kkia14MKyjqOXOO6ZxSYqb21O2/7gHV90oj3MLsCZBjX8xxXiQvndXFv020vcltn2vBUyOltkBx
+z/MHAnG/SvTogQ3XpnE0ubicQ1L6T8Ihbna/A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
KfB5e/V/GfJMul3HB0ehDJL4t1JR6jr0z826i7y1J2wrosePDh3JbFJhQ6q+dCArthp2R47uz6N0
wvnqiWs1XnO72EptgGhe4fReoKWi2L2OIZtWI/OONhTI0CmM9DMh+DWLENzMxHWOK2n4h9Oaa2Hy
KFFjlAVqoFIAV3iWyfPqtCedsFAfD8BlkXS8h+AkZl67s65p9MXKtOZzcrk+Shm9Jm5KG8TEy8GD
V0U+zGVFcm12aVUYaW7Ca+FNSwt6JZUDvIOgzyDtNbif8bUI4THiho41xhT5zTAS2zoXOkQwbHeK
8+pym6iBxs/ALhtFq1poQo3/8DVg8JKlYQhL2A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18768)
`pragma protect data_block
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
m5zwnUQKczdHPFAuuPkE
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
