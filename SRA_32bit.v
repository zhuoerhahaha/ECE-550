module SRA_32bit(A, shiftamt, shiftedA);
	input[31:0] A;
	input[4:0] shiftamt; // 
	
	output[31:0] shiftedA;
	wire[31:0] muxS0, muxS1, muxS2, muxS3, muxS4;
	
	// First stage using selector bit S0
	
	
	generate	
		genvar i;	
		for(i = 0; (i + 1) < 32; i = i + 1) begin: stage1
			assign muxS0[i] = shiftamt[0]? A[i+1] : A[i];
		end
	
	// Second stage using selector bit S1
	endgenerate
	
	generate
		genvar j;
		for(j = 0; (j + 2) < 32; j = j + 1) begin: stage2
			assign muxS1[j] = shiftamt[1]? muxS0[j+2] : muxS0[j];
		end
	endgenerate
	
	// Third stage using selector bit S2
	generate
		genvar k;
		for(k = 0; (k + 4) < 32; k = k + 1) begin: stage3
			assign muxS2[k] = shiftamt[2]? muxS1[k+4] : muxS1[k];
		end
	endgenerate	
	
	// Fourth stage using selector bit S3
	generate
		genvar m;
		for(m = 0; (m + 8) < 32; m = m + 1) begin: stage4
			assign muxS3[m] = shiftamt[3]? muxS2[m+8] : muxS2[m];
		end
	endgenerate
	
	// Fifth stage using selector bit S4
	generate
		genvar n;
		for(n = 0; (n + 16) < 32; n = n + 1) begin: stage5
			assign muxS4[n] = shiftamt[4]? muxS3[n+16] : muxS3[n];
		end
	endgenerate
	
		assign shiftedA = muxS4;
	
endmodule







/*
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
	
	// Second stage using selector bit S1
	endgenerate
	
	generate
		genvar j;
		for(j = 0; (j + 2) < 32; j = j + 1) begin: stage2
			assign muxS1[j] = shiftamount[1]? muxS0[j+2] : muxS0[j];
		end
	endgenerate
	
	// Third stage using selector bit S2
	generate
		genvar k;
		for(k = 0; (k + 4) < 32; k = k + 1) begin: stage3
			assign muxS2[k] = shiftamount[2]? muxS1[k+4] : muxS1[k];
		end
	endgenerate	
	
	// Fourth stage using selector bit S3
	generate
		genvar m;
		for(m = 0; (m + 8) < 32; m = m + 1) begin: stage4
			assign muxS3[m] = shiftamount[3]? muxS2[m+8] : muxS2[m];
		end
	endgenerate
	
	// Fifth stage using selector bit S4
	generate
		genvar n;
		for(n = 0; (n + 16) < 32; n = n + 1) begin: stage5
			assign muxS4[n] = shiftamount[4]? muxS3[n+16] : muxS3[n];
		end
	endgenerate
	
		assign out = muxS4;
	
endmodule
*/