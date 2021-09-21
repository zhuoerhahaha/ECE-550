module fourBitAdder (A, B, cin, sum, cout);

	input [3:0] A, B;
	input cin;
	output [3:0] sum;
	
	output cout;
	wire [2:0]  w;
	oneBit oneBit_0( .in_A(A[0]), .in_B(B[0]), .c_in(cin), .sum(sum[0]), .c_out(w[0]));
	oneBit oneBit_1( .in_A(A[1]), .in_B(B[1]), .c_in(w[0]), .sum(sum[1]), .c_out(w[1]));
	oneBit oneBit_2( .in_A(A[2]), .in_B(B[2]), .c_in(w[1]), .sum(sum[2]), .c_out(w[2]));
	oneBit oneBit_3( .in_A(A[3]), .in_B(B[3]), .c_in(w[2]), .sum(sum[3]), .c_out(cout));
	

endmodule