
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLIO-72default:default2B
.Placement Constraints Check for IO constraints2default:default2�
�An IO Bus SW[15:0] with more than one IO standard is found. Components associated with this bus are: LVCMOS18 (SW[9], SW[8]); LVCMOS33 (SW[15], SW[14], SW[13], SW[12], SW[11], SW[10], SW[7], SW[6], SW[5], SW[4], SW[3], SW[2], SW[1], SW[0]); 2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
82default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: 70b4fca7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:19 ; elapsed = 00:00:13 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2679 ; free virtual = 130592default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: 70b4fca7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:19 ; elapsed = 00:00:14 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2679 ; free virtual = 130592default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: 70b4fca7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:19 ; elapsed = 00:00:14 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2679 ; free virtual = 130592default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: 70b4fca7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:19 ; elapsed = 00:00:14 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2679 ; free virtual = 130592default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 1bdae9ca5
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:33 ; elapsed = 00:00:18 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2679 ; free virtual = 130592default:defaulth px� 
�
Intermediate Timing Summary %s164*route2N
:| WNS=-15.478| TNS=-1694.558| WHS=-0.612 | THS=-3584.293|
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 200afa5ea
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:41 ; elapsed = 00:00:20 . Memory (MB): peak = 2381.562 ; gain = 0.000 ; free physical = 2674 ; free virtual = 130542default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 114c9e488
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:03:08 ; elapsed = 00:00:42 . Memory (MB): peak = 2688.523 ; gain = 306.961 ; free physical = 2248 ; free virtual = 126282default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.1.1 Update Timing | Checksum: 1ea01aa28
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:56:48 ; elapsed = 00:13:09 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1477 ; free virtual = 118572default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-15.562| TNS=-2185.150| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
�
�Congestion is preventing the router from routing all nets. The router will prioritize the successful completion of routing all nets over timing optimizations.177*routeZ35-447h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 138d16e7e
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:56:57 ; elapsed = 00:13:11 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1477 ; free virtual = 118572default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.2.1 Update Timing | Checksum: 2d2e554cd
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:57:11 ; elapsed = 00:13:16 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1477 ; free virtual = 118572default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-15.563| TNS=-2162.046| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
v

Phase %s%s
101*constraints2
4.2.2 2default:default2%
GlobIterForTiming2default:defaultZ18-101h px� 
t

Phase %s%s
101*constraints2
4.2.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
G
2Phase 4.2.2.1 Update Timing | Checksum: 28ccad7a3
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:58:51 ; elapsed = 00:13:49 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1476 ; free virtual = 118562default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2.2.2 2default:default2"
Fast Budgeting2default:defaultZ18-101h px� 
H
3Phase 4.2.2.2 Fast Budgeting | Checksum: 28a2108b7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:58:51 ; elapsed = 00:13:50 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118562default:defaulth px� 
H
3Phase 4.2.2 GlobIterForTiming | Checksum: 8b490bab
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:59:56 ; elapsed = 00:14:00 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1476 ; free virtual = 118562default:defaulth px� 
G
2Phase 4.2 Global Iteration 1 | Checksum: 8b490bab
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:59:56 ; elapsed = 00:14:01 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1476 ; free virtual = 118562default:defaulth px� 
u

Phase %s%s
101*constraints2
4.3 2default:default2&
Global Iteration 22default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.3.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.3.1 Update Timing | Checksum: 1399ae402
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:35 ; elapsed = 00:14:54 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-15.553| TNS=-2178.068| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.3 Global Iteration 2 | Checksum: 1e50ebcc4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:36 ; elapsed = 00:14:55 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 1e50ebcc4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:36 ; elapsed = 00:14:55 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 17f60c94c
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:38 ; elapsed = 00:14:55 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-15.553| TNS=-2151.231| WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 12101a9f1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:41 ; elapsed = 00:14:56 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 12101a9f1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:41 ; elapsed = 00:14:56 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 12101a9f1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:41 ; elapsed = 00:14:56 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 6.1.1 Update Timing | Checksum: e20cb9a6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:46 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=-15.551| TNS=-2029.505| WHS=-0.612 | THS=-53.951|
2default:defaultZ35-416h px� 
�

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px� 
X
CPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: dc07cc33
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:46 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
B
-Phase 6.1 Hold Fix Iter | Checksum: dc07cc33
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:46 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
�The router encountered %s pins that are both setup-critical and hold-critical and tried to fix hold violations at the expense of setup slack. Such pins are:
%s201*route2
672default:default2�
�	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[13]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[12]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[11]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[10]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[9]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[8]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[7]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[6]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[5]
	bram2/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_init.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[4]
	.. and 57 more pins.
2default:defaultZ35-468h px� 
@
+Phase 6 Post Hold Fix | Checksum: cb50bb4b
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:46 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 11c92707f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:47 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 11c92707f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:47 ; elapsed = 00:14:57 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 16bab229f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:48 ; elapsed = 00:14:58 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 10.1 Update Timing | Checksum: 16c40a1cb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:52 ; elapsed = 00:14:59 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
Estimated Timing Summary %s
57*route2L
8| WNS=-15.551| TNS=-2029.505| WHS=-0.612 | THS=-53.861|
2default:defaultZ35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
G
2Phase 10 Post Router Timing | Checksum: 16c40a1cb
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:52 ; elapsed = 00:14:59 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2N
:probey/inst/ila_core_inst/shifted_data_in_reg[7][0]_srl8/D2default:default2"
BUFGCTRL_X0Y162default:defaultZ35-419h px� 
�
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2C
/probey/inst/ila_core_inst/probeDelay1[0]_i_1/I12default:default2"
BUFGCTRL_X0Y162default:defaultZ35-419h px� 
�
IRouter was unable to fix hold violation on pin %s driven by MMCM site %s.172*route2/
clockgen/inst/clkout1_buf/I2default:default2#
MMCME2_ADV_X1Y22default:defaultZ35-424h px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2�
�Time (s): cpu = 01:02:52 ; elapsed = 00:14:59 . Memory (MB): peak = 3445.523 ; gain = 1063.961 ; free physical = 1475 ; free virtual = 118552default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1012default:default2
92default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
route_design: 2default:default2
01:02:542default:default2
00:15:002default:default2
3445.5272default:default2
1063.9652default:default2
14752default:default2
118552default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:052default:default2
00:00:032default:default2
3477.5392default:default2
0.0002default:default2
13932default:default2
118562default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:072default:default2
00:00:052default:default2
3477.5432default:default2
32.0162default:default2
14542default:default2
118562default:defaultZ17-722h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
j/afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.runs/impl_1/nexys4_fft_demo_drc_routed.rptj/afs/athena.mit.edu/user/c/h/cherna/Documents/fft_demo/fft_demo.runs/impl_1/nexys4_fft_demo_drc_routed.rpt2default:default8Z2-168h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -3, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
82default:defaultZ38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
�Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px� 


End Record