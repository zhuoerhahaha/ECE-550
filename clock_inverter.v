module clock_inverter(clock_in,clock_out);
	input clock_in; // input clock on FPGA
	output clock_out; // output clock after dividing the input clock by divisor
	not invClk(clock_out, clock_in);
endmodule
