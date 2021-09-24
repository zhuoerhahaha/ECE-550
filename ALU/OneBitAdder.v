module OneBitAdder(inA, inB, cin, sum, cout);
	input inA, inB, cin;
	output sum, cout;
	wire wire1, wire2, wire3;
	xor xor_1(wire1, inA, inB);
	xor xor_2(sum, wire1, cin);
	and and_1(wire2, wire1, cin);
	and and_2(wire3, inB, inA);	
	or or_1(cout, wire3, wire2);
endmodule
