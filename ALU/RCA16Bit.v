module RCA16Bit(in1, in2, cin, sum, cout, overflow);
	input[15:0] in1, in2;
	output[15:0] sum;
	
	input cin;	
	output overflow, cout;
	wire[14:0] w;
	
	OneBitAdder Full1(.inA(in1[0]), .inB(in2[0]), .cin(cin), .sum(sum[0]), .cout(w[0]));
	OneBitAdder Full2(.inA(in1[1]), .inB(in2[1]), .cin(w[0]), .sum(sum[1]), .cout(w[1]));
	OneBitAdder Full3(.inA(in1[2]), .inB(in2[2]), .cin(w[1]), .sum(sum[2]), .cout(w[2]));
	OneBitAdder Full4(.inA(in1[3]), .inB(in2[3]), .cin(w[2]), .sum(sum[3]), .cout(w[3]));
	OneBitAdder Full5(.inA(in1[4]), .inB(in2[4]), .cin(w[3]), .sum(sum[4]), .cout(w[4]));
	OneBitAdder Full6(.inA(in1[5]), .inB(in2[5]), .cin(w[4]), .sum(sum[5]), .cout(w[5]));
	OneBitAdder Full7(.inA(in1[6]), .inB(in2[6]), .cin(w[5]), .sum(sum[6]), .cout(w[6]));
	OneBitAdder Full8(.inA(in1[7]), .inB(in2[7]), .cin(w[6]), .sum(sum[7]), .cout(w[7]));
	OneBitAdder Full9(.inA(in1[8]), .inB(in2[8]), .cin(w[7]), .sum(sum[8]), .cout(w[8]));
	OneBitAdder Full10(.inA(in1[9]), .inB(in2[9]), .cin(w[8]), .sum(sum[9]), .cout(w[9]));
	OneBitAdder Full11(.inA(in1[10]), .inB(in2[10]), .cin(w[9]), .sum(sum[10]), .cout(w[10]));
	OneBitAdder Full12(.inA(in1[11]), .inB(in2[11]), .cin(w[10]), .sum(sum[11]), .cout(w[11]));
	OneBitAdder Full13(.inA(in1[12]), .inB(in2[12]), .cin(w[11]), .sum(sum[12]), .cout(w[12]));
	OneBitAdder Full14(.inA(in1[13]), .inB(in2[13]), .cin(w[12]), .sum(sum[13]), .cout(w[13]));
	OneBitAdder Full15(.inA(in1[14]), .inB(in2[14]), .cin(w[13]), .sum(sum[14]), .cout(w[14]));
	OneBitAdder Full16(.inA(in1[15]), .inB(in2[15]), .cin(w[14]), .sum(sum[15]), .cout(cout));
	
	xor xor_bit(overflow, w[14], cout); 

endmodule
