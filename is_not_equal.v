module is_not_equal(A, B, out);
	input[31:0] A, B;
	output out;
	
	wire[31:0] xor_res;
	wire temp[30:0];
	
	//XOR Operation
	generate	
		genvar i;	
		for(i = 0; i < 32; i = i + 1) begin: xor_operation
			xor(xor_res[i], A[i], B[i]);
		end  
	endgenerate
	
	//OR Operation
	or(temp[0], xor_res[0], xor_res[1]);
	generate	
		genvar j;	
		for(j = 0; j < 30; j = j + 1) begin: or_operation
			or(temp[j+1], temp[j], xor_res[j+2]);
		end  
	endgenerate
	
	//Final Assign
		
	assign out = temp[30];

endmodule
