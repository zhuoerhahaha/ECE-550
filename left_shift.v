module left_shift(in, shiftamout, out);
	input[31:0] in;
	input[4:0] shiftamout;
	
	output[31:0] out;
	
	wire[31:0] layer1, layer2, layer3, layer4, layer5;
	
	
	//first layer
	generate
		genvar i;
		assign layer1[0] = shiftamout[0] ? 1'b0 : in[0];
		for(i = 1; i < 32; i = i+1) begin: stage1
			assign layer1[i] = shiftamout[0] ? in[i-1] : in[i];
		end
	endgenerate

	
	
	
	//second layer
	generate
		assign layer2[0] = shiftamout[1] ? 1'b0 : layer1[0];
		assign layer2[1] = shiftamout[1] ? 1'b0 : layer1[1];
		genvar j;
		for(j = 2; j < 32; j = j+1) begin: stage2
			assign layer2[j] = shiftamout[1] ? layer1[j-2] : layer1[j];
		end
	endgenerate


	
	//thrid layer
	generate
		genvar k0;
		for(k0 = 0; k0 < 4; k0 = k0 + 1) begin: stage3a
			assign layer3[k0] = shiftamout[2] ? 1'b0 : layer2[k0];
		end
	endgenerate

	generate
		genvar k1;
		for(k1 = 4; k1 < 32; k1 = k1 + 1) begin: stage3b
			assign layer3[k1] = shiftamout[2] ? layer2[k1 - 4] : layer2[k1];
		end
	endgenerate


	//fourth layer
	generate
		genvar l0;
		for(l0 = 0; l0 < 8; l0 = l0 + 1) begin: stage4a
			assign layer4[l0] = shiftamout[3] ? 1'b0 : layer3[l0];
		end
	endgenerate

	generate
		genvar l1;
		for(l1 = 8; l1 < 32; l1 = l1 + 1) begin: stage4b
			assign layer4[l1] = shiftamout[3] ? layer3[l1 - 8] : layer3[l1];
		end
	endgenerate


	//fifth layer
	generate
		genvar m0;
		for(m0 = 0; m0 < 16; m0 = m0 + 1) begin: stage5a
			assign out[m0] = shiftamout[4] ? 1'b0 : layer4[m0];
		end
	endgenerate

	generate
		genvar m1;
		for(m1 = 16; m1 < 32; m1 = m1 + 1) begin: stage5b
			assign out[m1] = shiftamout[4] ? layer4[m1 - 16] : layer4[m1];
		end
	endgenerate
	
	
	
endmodule




















