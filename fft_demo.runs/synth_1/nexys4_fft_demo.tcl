# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.cache/wt [current_project]
set_property parent.project_path /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
add_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/hanning_4096.coe
add_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/chroma_bins.coe
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins.dcp]
add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/ila_0/ila_0.dcp
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/ila_0/ila_0.dcp]
add_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/fft_mag.bd
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_cordic_0_0/fft_mag_cordic_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xfft_0_0/fft_mag_xfft_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/fft_mag_ooc.xdc]
set_property is_locked true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/fft_mag.bd]

read_verilog -library xil_defaultlib {
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/new/chroma.v
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/imports/hdl/oversampler.v
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/imports/hdl/histogram.v
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/imports/hdl/utils.v
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/imports/hdl/bram_to_fft.v
  /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/imports/hdl/nexys4_fft_demo.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/constrs_1/imports/constraints/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/constrs_1/imports/constraints/Nexys4DDR_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top nexys4_fft_demo -part xc7a100tcsg324-3


write_checkpoint -force -noxdef nexys4_fft_demo.dcp

catch { report_utilization -file nexys4_fft_demo_utilization_synth.rpt -pb nexys4_fft_demo_utilization_synth.pb }