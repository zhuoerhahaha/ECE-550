module pc (clock, reset, pc_in, pc_out);
	input clock, reset;
	input[31:0] pc_in;
	output[31:0] pc_out;
	/*
	input clock, reset;
	input[31:0] pc_in;
	output[31:0] pc_out；
	
	genvar i;
	generate
	for(i = 0; i < 32; i=i+1) begin:pc
		dffe_ref dff(.q(pc_out), .d(pc_in), .clk(clock), .en(1'b1), .clr(reset));
	end
	endgenerate;
	*/
endmodule
