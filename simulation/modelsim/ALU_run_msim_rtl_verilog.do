transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/bit_And.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/bit_Or.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/left_shift.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/right_shift.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/is_not_equal.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/CheckAddSub.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/RCA16Bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/OneBitAdder.v}

vlog -vlog01compat -work work +incdir+C:/Users/jerry/OneDrive\ -\ Duke\ University/Duke/550/Project/Project2/ECE-550 {C:/Users/jerry/OneDrive - Duke University/Duke/550/Project/Project2/ECE-550/ALU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
