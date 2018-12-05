proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.cache/wt [current_project]
  set_property parent.project_path /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.xpr [current_project]
  set_property ip_repo_paths /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.cache/ip [current_project]
  set_property ip_output_repo /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.runs/synth_1/nexys4_fft_demo.dcp
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_axis_register_slice_2_0/fft_mag_axis_register_slice_2_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_cordic_0_0/fft_mag_cordic_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_cordic_0_0/fft_mag_cordic_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xfft_0_0/fft_mag_xfft_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xfft_0_0/fft_mag_xfft_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_0_0/fft_mag_xlconstant_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_0_0/fft_mag_xlconstant_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_1_0/fft_mag_xlconstant_1_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_1_0/fft_mag_xlconstant_1_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_2_0/fft_mag_xlconstant_2_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconstant_2_0/fft_mag_xlconstant_2_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlslice_0_0/fft_mag_xlslice_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlslice_0_0/fft_mag_xlslice_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlslice_1_0/fft_mag_xlslice_1_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlslice_1_0/fft_mag_xlslice_1_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconcat_0_0/fft_mag_xlconcat_0_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_xlconcat_0_0/fft_mag_xlconcat_0_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins.dcp]
  add_files -quiet /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo.dcp
  set_property netlist_only true [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo.dcp]
  read_xdc -mode out_of_context -ref bram_fft -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_fft/bram_fft_ooc.xdc]
  read_xdc -mode out_of_context -ref xadc_demo -cells inst /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo_ooc.xdc]
  read_xdc -ref xadc_demo -cells inst /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/xadc_demo/xadc_demo.xdc]
  read_xdc -mode out_of_context -ref clk_wiz_0 -cells inst /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells inst /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -mode out_of_context -ref bram_frame -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/bram_frame/bram_frame_ooc.xdc]
  read_xdc -mode out_of_context -ref hanning -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/hanning/hanning_ooc.xdc]
  read_xdc -mode out_of_context -ref chroma_bins -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_bins/chroma_bins_ooc.xdc]
  read_xdc -mode out_of_context -ref chroma_fifo -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo_ooc.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo_ooc.xdc]
  read_xdc -ref chroma_fifo -cells U0 /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo/chroma_fifo.xdc
  set_property processing_order EARLY [get_files /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/sources_1/ip/chroma_fifo/chroma_fifo/chroma_fifo.xdc]
  read_xdc /afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.srcs/constrs_1/imports/constraints/Nexys4DDR_Master.xdc
  link_design -top nexys4_fft_demo -part xc7a100tcsg324-3
  write_hwdef -file nexys4_fft_demo.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force nexys4_fft_demo_opt.dcp
  report_drc -file nexys4_fft_demo_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force nexys4_fft_demo_placed.dcp
  report_io -file nexys4_fft_demo_io_placed.rpt
  report_utilization -file nexys4_fft_demo_utilization_placed.rpt -pb nexys4_fft_demo_utilization_placed.pb
  report_control_sets -verbose -file nexys4_fft_demo_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force nexys4_fft_demo_routed.dcp
  report_drc -file nexys4_fft_demo_drc_routed.rpt -pb nexys4_fft_demo_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file nexys4_fft_demo_timing_summary_routed.rpt -rpx nexys4_fft_demo_timing_summary_routed.rpx
  report_power -file nexys4_fft_demo_power_routed.rpt -pb nexys4_fft_demo_power_summary_routed.pb -rpx nexys4_fft_demo_power_routed.rpx
  report_route_status -file nexys4_fft_demo_route_status.rpt -pb nexys4_fft_demo_route_status.pb
  report_clock_utilization -file nexys4_fft_demo_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

