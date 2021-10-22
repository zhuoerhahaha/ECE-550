module RCA_32bit(s,a, b);
	input [31:0] a, b;
	output [31:0] s;
	
	wire [31:0] Cout;
	
	wire Cout_last;
	full_adder my_full_adder(.a(a[0]), .b(b[0]) , .cin(1'b0), .sum(s[0]), .cout(Cout[0]));
	genvar i;
	generate
	for(i = 1; i < 32; i++) begin: add
	full_adder my_full_adder(.a(a[i]), .b(b[i]), .cin(Cout[i - 1]), .sum(s[i]), .cout(Cout[i]));
	end
	endgenerate
	
endmodule;