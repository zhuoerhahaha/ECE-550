module right_shift(in, shiftamount, out);
	input[31:0] in;
	input[4:0] shiftamount; // 
	
	output[31:0] out;
	wire[31:0] muxS0, muxS1, muxS2, muxS3, muxS4;
	
	// First stage using selector bit S0
	
	
	generate	
		genvar i;	
		for(i = 0; (i + 1) < 32; i = i + 1) begin: stage1
			assign muxS0[i] = shiftamount[0]? in[i+1] : in[i];
		end
		assign muxS0[31] = in[31];    
	
	// Second stage using selector bit S1
	endgenerate
	
	generate
		genvar j;
		for(j = 0; (j + 2) < 32; j = j + 1) begin: stage2
			assign muxS1[j] = shiftamount[1]? muxS0[j+2] : muxS0[j];
		end
		assign muxS1[30] = shiftamount[1]? muxS0[31] : muxS0[30];
		assign muxS1[31] = muxS0[31]; 
	endgenerate
	
	
	
	// Third stage using selector bit S2
	generate
		genvar k;
		for(k = 0; (k + 4) < 32; k = k + 1) begin: stage3
			assign muxS2[k] = shiftamount[2]? muxS1[k+4] : muxS1[k];
		end
	endgenerate

	generate
		genvar k1;
		for(k1 = 28; k1 < 31; k1 = k1 + 1) begin: stage3_1
			assign muxS2[k1] = shiftamount[2]? muxS1[31]: muxS1[k1];
		end
	endgenerate
		assign muxS2[31] = muxS1[31]; 
	
	
	
	// Fourth stage using selector bit S3
	generate
		genvar m;
		for(m = 0; (m + 8) < 32; m = m + 1) begin: stage4
			assign muxS3[m] = shiftamount[3]? muxS2[m+8] : muxS2[m];
		end
	endgenerate
	
	generate
		genvar m1;
		for(m1 = 24; m1 < 31; m1 = m1 + 1) begin: stage4_1
			assign muxS3[m1] = shiftamount[4]? muxS2[31] : muxS2[m1];
		end
	endgenerate
		assign muxS3[31] = muxS2[31];
	
	
	
	
	// Fifth stage using selector bit S4
	generate
		genvar n;
		for(n = 0; (n + 16) < 32; n = n + 1) begin: stage5
			assign muxS4[n] = shiftamount[4]? muxS3[n+16] : muxS3[n];
		end
	endgenerate
	
	generate
		genvar n1;
		for(n1 = 16; n1 < 31; n1 = n1 + 1) begin: stage5_1
			assign muxS4[n1] = shiftamount[4]? muxS3[31] : muxS3[n1];
		end		
	endgenerate
	
	assign muxS4[31] = muxS3[31];	
	
	assign out = muxS4;
	
endmodule
