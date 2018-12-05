set_property -quiet CLOCK_PERIOD_OOC_TARGET 9.615 [get_ports -no_traverse -quiet CLK]
set_property -quiet IS_IP_OOC_CELL TRUE [get_cells -of [get_ports -no_traverse -quiet A[0]]]
