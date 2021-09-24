module bit_And(ina, inb, out);
	input[31:0] ina, inb;
	output[31:0] out;
	
	generate	
		genvar i;	
		for(i = 0; i < 32; i = i + 1) begin: and_operation
			and(out[i], ina[i], inb[i]);
		end  
	endgenerate
endmodule
	
	