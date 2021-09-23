onerror {exit -code 1}
vlib work
vlog -work work ALU.vo
vlog -work work Waveform7.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.is_not_equal_vlg_vec_tst -voptargs="+acc"
vcd file -direction ALU.msim.vcd
vcd add -internal is_not_equal_vlg_vec_tst/*
vcd add -internal is_not_equal_vlg_vec_tst/i1/*
run -all
quit -f
