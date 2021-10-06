module dec2to4(a, b);
	input[1:0] a;
	output[3:0] b;
	wire[1:0] nota;
	
	not not0(nota[0], a[0]);
	not not1(nota[1], a[1]);
	
	and and0(b[0], nota[1], nota[0]);
	and and1(b[1], nota[1], a[0]);
	and and2(b[2], a[1], nota[0]);
	and and3(b[3], a[1], a[0]);
endmodule

	

module dec3to8(b, a, en);
	input[2:0] a;
	input en;
	output[7:0] b;
	
	wire[15:0] temp;
	wire[2:0] nota;
	
	not not0(nota[0], a[0]);
	not not1(nota[1], a[1]);
	not not2(nota[2], a[2]);
	
	and and0(temp[0], nota[1], nota[0]);
	and and1(temp[1], nota[2], temp[0]);
	and and16(b[0], temp[1], en);
	
	and and2(temp[2], nota[1], a[0]);
	and and3(temp[3], nota[2], temp[2]);
	and and17(b[1], temp[3], en);
	
	and and4(temp[4], a[1], nota[0]);
	and and5(temp[5], nota[2], temp[4]);
	and and18(b[2], temp[5], en);
	
	and and6(temp[6], a[1], a[0]);
	and and7(temp[7], nota[2], temp[6]);
	and and19(b[3], temp[7], en);
	
	and and8(temp[8], nota[1], nota[0]);
	and and9(temp[9], a[2], temp[8]);
	and and20(b[4], temp[9], en);
	
	and and10(temp[10], nota[1], a[0]);
	and and11(temp[11], a[2], temp[10]);
	and and21(b[5], temp[11], en);
	
	and and12(temp[12], a[1], nota[0]);
	and and13(temp[13], a[2], temp[12]);
	and and22(b[6], temp[13], en);
	
	and and14(temp[14], a[1], a[0]);
	and and15(temp[15], a[2], temp[14]);
	and and23(b[7], temp[15], en);
endmodule
	
	
module dec5to32(a, b);
	input[4:0] a;
	output[31:0] b;
	wire [3:0] w;
	
	
	dec2to4 d0(a[4:3], w);
	dec3to8 d1(b[7:0], a[2:0],w[0]);
	dec3to8 d2(b[15:8], a[2:0],w[1]);
	dec3to8 d3(b[23:16], a[2:0],w[2]);
	dec3to8 d4(b[31:24], a[2:0],w[3]);
endmodule
	
	
	
	
	
	
	
	
	