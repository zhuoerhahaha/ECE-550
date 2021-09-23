module CheckAddSub(A, B, mode, overflow, D);
	input[31:0] A, B;
	output[31:0] D;
	input mode;
	output overflow;
	
	wire[31:0] bit;
	wire[15:0] result_first, result_second_cin0, result_second_cin1;
	wire[2:0] cout_bit;
	wire[2:0] overflow_bit;
	
	xor xor_bit0(bit[0], B[0], mode);
	xor xor_bit1(bit[1], B[1], mode);
	xor xor_bit2(bit[2], B[2], mode);
	xor xor_bit3(bit[3], B[3], mode);
	xor xor_bit4(bit[4], B[4], mode);
	xor xor_bit5(bit[5], B[5], mode);
	xor xor_bit6(bit[6], B[6], mode);
	xor xor_bit7(bit[7], B[7], mode);
	xor xor_bit8(bit[8], B[8], mode);
	xor xor_bit9(bit[9], B[9], mode);
	xor xor_bit10(bit[10], B[10], mode);
	xor xor_bit11(bit[11], B[11], mode);
	xor xor_bit12(bit[12], B[12], mode);
	xor xor_bit13(bit[13], B[13], mode);
	xor xor_bit14(bit[14], B[14], mode);
	xor xor_bit15(bit[15], B[15], mode);
	xor xor_bit16(bit[16], B[16], mode);
	xor xor_bit17(bit[17], B[17], mode);
	xor xor_bit18(bit[18], B[18], mode);
	xor xor_bit19(bit[19], B[19], mode);
	xor xor_bit20(bit[20], B[20], mode);
	xor xor_bit21(bit[21], B[21], mode);
	xor xor_bit22(bit[22], B[22], mode);
	xor xor_bit23(bit[23], B[23], mode);
	xor xor_bit24(bit[24], B[24], mode);
	xor xor_bit25(bit[25], B[25], mode);
	xor xor_bit26(bit[26], B[26], mode);
	xor xor_bit27(bit[27], B[27], mode);
	xor xor_bit28(bit[28], B[28], mode);
	xor xor_bit29(bit[29], B[29], mode);
	xor xor_bit30(bit[30], B[30], mode);
	xor xor_bit31(bit[31], B[31], mode);
	
	RCA16Bit first(.in1(A[15:0]), .in2(bit[15:0]), .cin(mode), .sum(D[15:0]), .cout(cout_bit[0]), .overflow(overflow_bit[0]));
	RCA16Bit second_cin0(.in1(A[31:16]), .in2(bit[31:16]), .cin(1'b0), .sum(result_second_cin0), .cout(cout_bit[1]), .overflow(overflow_bit[1]));
	RCA16Bit second_cin1(.in1(A[31:16]), .in2(bit[31:16]), .cin(1'b1), .sum(result_second_cin1), .cout(cout_bit[2]), .overflow(overflow_bit[2]));
	
	assign D[31:16] = cout_bit[0]? result_second_cin1 : result_second_cin0;
	assign overflow = cout_bit[0]? overflow_bit[2] : overflow_bit[1];
	
endmodule
