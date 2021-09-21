module oneBit(in_A, in_B, c_in, sum, c_out);

	input in_A, in_B, c_in;
	output sum, c_out;
	wire wire_1, wire_2, wire_3;
	and and_1(wire_2, wire_1, c_in), and_2(wire_3, in_A, in_B);
	xor xor_1(wire_1, in_A, in_B), xor_2(sum, wire_1, c_in);
	or or_1(c_out, wire_3, wire_2);

endmodule