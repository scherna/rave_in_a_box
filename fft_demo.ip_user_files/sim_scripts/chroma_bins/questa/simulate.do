onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib chroma_bins_opt

do {wave.do}

view wave
view structure
view signals

do {chroma_bins.udo}

run -all

quit -force
