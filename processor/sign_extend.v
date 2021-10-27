module sign_extend(in, out);
	input[15:0] in;
	output[31:0] out;
	
	reg[31:0] out;
	
	always begin
		out[31:0] <= { {16{in[15]}}, in[15:0] };
	end
	
endmodule
