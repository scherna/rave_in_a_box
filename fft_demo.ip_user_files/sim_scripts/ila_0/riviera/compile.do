vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"/var/local/xilinx-local/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ila_v6_1_1/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../../fft_demo.srcs/sources_1/ip/ila_0/xsdbs_v1_0_2/hdl/verilog" \
"../../../../fft_demo.srcs/sources_1/ip/ila_0/sim/ila_0.v" \

vlog -work xil_defaultlib "glbl.v"

