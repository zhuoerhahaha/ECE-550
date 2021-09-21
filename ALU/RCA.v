module RCA(A16, B16, cin16, sum16, cout16);

	input [15:0] A16, B16;
	input  cin16;
	output [15:0] sum16;
	
	output cout16;
	wire [2:0]  w16;
	fourBitAdder fourBit_0( .A(A16[3:0]), .B(B16[3:0]), .cin(cin16), .sum(sum16[3:0]), .cout(w16[0]));
	fourBitAdder fourBit_1( .A(A16[7:4]), .B(B16[7:4]), .cin(w16[0]), .sum(sum16[7:4]), .cout(w16[1]));
	fourBitAdder fourBit_2( .A(A16[11:8]), .B(B16[11:8]), .cin(w16[1]), .sum(sum16[11:8]), .cout(w16[2]));
	fourBitAdder fourBit_3( .A(A16[15:12]), .B(B16[15:12]), .cin(w16[2]), .sum(sum16[15:12]), .cout(cout16));


endmodule