module CSA(a, b, cin, ove, sum);
	input[31:0] a, b;
	input[4:0] cin;
	output ove;
	output[31:0] sum;
	wire c0, cext0, cext1, c_lastin0, c_lastin1, ove0, ove1;
	wire[15:0] out0, out1;
	
	RCA rca0(a[15:0], b[15:0], cin[0], sum[15:0], c0);      //need 16bit RCA
	RCA_special rca1(a[31:16], b[31:16], 1'b0, out0, cext0, c_lastin0);
	RCA_special rca2(a[31:16], b[31:16], 1'b1, out1, cext1, c_lastin1);
	
	//2-1 mux
	assign sum[31:16] = c0 ?  out1 : out0;  
	
	//overflow
	xor(ove1, c_lastin1, cext1);
	xor(ove0, c_lastin0, cext0);
	
	assign ove = c0 ? ove1 : ove0;
endmodule
	
	