module RCA_special(A16, B16, cin16, sum16, cout16, c_lastin);
	input [15:0] A16, B16;
	input  cin16;
	output [15:0] sum16;
	output cout16;
	wire [5:0]  w16;
	
	output c_lastin;
	

	fourBitAdder fourBit_0( .A(A16[3:0]), .B(B16[3:0]), .cin(cin16), .sum(sum16[3:0]), .cout(w16[0]));
	fourBitAdder fourBit_1( .A(A16[7:4]), .B(B16[7:4]), .cin(w16[0]), .sum(sum16[7:4]), .cout(w16[1]));
	fourBitAdder fourBit_2( .A(A16[11:8]), .B(B16[11:8]), .cin(w16[1]), .sum(sum16[11:8]), .cout(w16[2]));
	//last four_group adder need to use 1 bit FA to get the last c_in
	oneBit oneBit_0( .in_A(A16[12]), .in_B(B16[12]), .c_in(w16[2]), .sum(sum16[12]), .c_out(w16[3]));
	oneBit oneBit_1( .in_A(A16[13]), .in_B(B16[13]), .c_in(w16[3]), .sum(sum16[13]), .c_out(w16[4]));
	oneBit oneBit_2( .in_A(A16[14]), .in_B(B16[14]), .c_in(w16[4]), .sum(sum16[14]), .c_out(w16[5]));
	oneBit oneBit_3( .in_A(A16[15]), .in_B(B16[15]), .c_in(w16[5]), .sum(sum16[15]), .c_out(cout16));
	
	assign c_lastin = w16[5];
	
endmodule