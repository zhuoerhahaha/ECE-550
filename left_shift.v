module left_shift(in, shiftamout, out);
	input[31:0] in;
	input[4:0] shiftamout;
	
	output[31:0] out;
	
	wire[31:0] layer1, layer2, layer3, layer4, layer5;
	
	
	//first layer
	assign layer1[0] = shiftamout[0] ? 1'b0 : in[0];
	assign layer1[1] = shiftamout[0] ? in[0] : in[1];
	assign layer1[2] = shiftamout[0] ? in[1] : in[2];
	assign layer1[3] = shiftamout[0] ? in[2] : in[3];
	assign layer1[4] = shiftamout[0] ? in[3] : in[4];
	assign layer1[5] = shiftamout[0] ? in[4] : in[5];
	assign layer1[6] = shiftamout[0] ? in[5] : in[6];
	assign layer1[7] = shiftamout[0] ? in[6] : in[7];
	assign layer1[8] = shiftamout[0] ? in[7] : in[8];
	assign layer1[9] = shiftamout[0] ? in[8] : in[9];
	assign layer1[10] = shiftamout[0] ? in[9] : in[10];
	assign layer1[11] = shiftamout[0] ? in[10] : in[11];
	assign layer1[12] = shiftamout[0] ? in[11] : in[12];
	assign layer1[13] = shiftamout[0] ? in[12] : in[13];
	assign layer1[14] = shiftamout[0] ? in[13] : in[14];
	assign layer1[15] = shiftamout[0] ? in[14] : in[15];
	assign layer1[16] = shiftamout[0] ? in[15] : in[16];
	assign layer1[17] = shiftamout[0] ? in[16] : in[17];
	assign layer1[18] = shiftamout[0] ? in[17] : in[18];
	assign layer1[19] = shiftamout[0] ? in[18] : in[19];
	assign layer1[20] = shiftamout[0] ? in[19] : in[20];
	assign layer1[21] = shiftamout[0] ? in[20] : in[21];
	assign layer1[22] = shiftamout[0] ? in[21] : in[22];
	assign layer1[23] = shiftamout[0] ? in[22] : in[23];
	assign layer1[24] = shiftamout[0] ? in[23] : in[24];
	assign layer1[25] = shiftamout[0] ? in[24] : in[25];
	assign layer1[26] = shiftamout[0] ? in[25] : in[26];
	assign layer1[27] = shiftamout[0] ? in[26] : in[27];
	assign layer1[28] = shiftamout[0] ? in[27] : in[28];
	assign layer1[29] = shiftamout[0] ? in[28] : in[29];
	assign layer1[30] = shiftamout[0] ? in[29] : in[30];
	assign layer1[31] = shiftamout[0] ? in[30] : in[31];
	
	
	
	
	//second layer
	assign layer2[0] = shiftamout[1] ? 1'b0 : layer1[0];
	assign layer2[1] = shiftamout[1] ? 1'b0 : layer1[1];
	assign layer2[2] = shiftamout[1] ? layer1[0] : layer1[2];
	assign layer2[3] = shiftamout[1] ? layer1[1] : layer1[3];
	assign layer2[4] = shiftamout[1] ? layer1[2] : layer1[4];
	assign layer2[5] = shiftamout[1] ? layer1[3] : layer1[5];
	assign layer2[6] = shiftamout[1] ? layer1[4] : layer1[6];
	assign layer2[7] = shiftamout[1] ? layer1[5] : layer1[7];
	assign layer2[8] = shiftamout[1] ? layer1[6] : layer1[8];
	assign layer2[9] = shiftamout[1] ? layer1[7] : layer1[9];
	assign layer2[10] = shiftamout[1] ? layer1[8] : layer1[10];
	assign layer2[11] = shiftamout[1] ? layer1[9] : layer1[11];
	assign layer2[12] = shiftamout[1] ? layer1[10] : layer1[12];
	assign layer2[13] = shiftamout[1] ? layer1[11] : layer1[13];
	assign layer2[14] = shiftamout[1] ? layer1[12] : layer1[14];
	assign layer2[15] = shiftamout[1] ? layer1[13] : layer1[15];
	assign layer2[16] = shiftamout[1] ? layer1[14] : layer1[16];
	assign layer2[17] = shiftamout[1] ? layer1[15] : layer1[17];
	assign layer2[18] = shiftamout[1] ? layer1[16] : layer1[18];
	assign layer2[19] = shiftamout[1] ? layer1[17] : layer1[19];
	assign layer2[20] = shiftamout[1] ? layer1[18] : layer1[20];
	assign layer2[21] = shiftamout[1] ? layer1[19] : layer1[21];
	assign layer2[22] = shiftamout[1] ? layer1[20] : layer1[22];
	assign layer2[23] = shiftamout[1] ? layer1[21] : layer1[23];
	assign layer2[24] = shiftamout[1] ? layer1[22] : layer1[24];
	assign layer2[25] = shiftamout[1] ? layer1[23] : layer1[25];
	assign layer2[26] = shiftamout[1] ? layer1[24] : layer1[26];
	assign layer2[27] = shiftamout[1] ? layer1[25] : layer1[27];
	assign layer2[28] = shiftamout[1] ? layer1[26] : layer1[28];
	assign layer2[29] = shiftamout[1] ? layer1[27] : layer1[29];
	assign layer2[30] = shiftamout[1] ? layer1[28] : layer1[30];
	assign layer2[31] = shiftamout[1] ? layer1[29] : layer1[31];
	
	
	//thrid layer
	assign layer3[0] = shiftamout[2] ? 1'b0 : layer2[0];
	assign layer3[1] = shiftamout[2] ? 1'b0 : layer2[1];
	assign layer3[2] = shiftamout[2] ? 1'b0 : layer2[2];
	assign layer3[3] = shiftamout[2] ? 1'b0 : layer2[3];
	assign layer3[4] = shiftamout[2] ? layer2[0] : layer2[4];
	assign layer3[5] = shiftamout[2] ? layer2[1] : layer2[5];
	assign layer3[6] = shiftamout[2] ? layer2[2] : layer2[6];
	assign layer3[7] = shiftamout[2] ? layer2[3] : layer2[7];
	assign layer3[8] = shiftamout[2] ? layer2[4] : layer2[8];
	assign layer3[9] = shiftamout[2] ? layer2[5] : layer2[9];
	assign layer3[10] = shiftamout[2] ? layer2[6] : layer2[10];
	assign layer3[11] = shiftamout[2] ? layer2[7] : layer2[11];
	assign layer3[12] = shiftamout[2] ? layer2[8] : layer2[12];
	assign layer3[13] = shiftamout[2] ? layer2[9] : layer2[13];
	assign layer3[14] = shiftamout[2] ? layer2[10] : layer2[14];
	assign layer3[15] = shiftamout[2] ? layer2[11] : layer2[15];
	assign layer3[16] = shiftamout[2] ? layer2[12] : layer2[16];
	assign layer3[17] = shiftamout[2] ? layer2[13] : layer2[17];
	assign layer3[18] = shiftamout[2] ? layer2[14] : layer2[18];
	assign layer3[19] = shiftamout[2] ? layer2[15] : layer2[19];
	assign layer3[20] = shiftamout[2] ? layer2[16] : layer2[20];
	assign layer3[21] = shiftamout[2] ? layer2[17] : layer2[21];
	assign layer3[22] = shiftamout[2] ? layer2[18] : layer2[22];
	assign layer3[23] = shiftamout[2] ? layer2[19] : layer2[23];
	assign layer3[24] = shiftamout[2] ? layer2[20] : layer2[24];
	assign layer3[25] = shiftamout[2] ? layer2[21] : layer2[25];
	assign layer3[26] = shiftamout[2] ? layer2[22] : layer2[26];
	assign layer3[27] = shiftamout[2] ? layer2[23] : layer2[27];
	assign layer3[28] = shiftamout[2] ? layer2[24] : layer2[28];
	assign layer3[29] = shiftamout[2] ? layer2[25] : layer2[29];
	assign layer3[30] = shiftamout[2] ? layer2[26] : layer2[30];
	assign layer3[31] = shiftamout[2] ? layer2[27] : layer2[31];
	
	//fourth layer
	assign layer4[0] = shiftamout[3] ? 1'b0 : layer3[0];
	assign layer4[1] = shiftamout[3] ? 1'b0 : layer3[1];
	assign layer4[2] = shiftamout[3] ? 1'b0 : layer3[2];
	assign layer4[3] = shiftamout[3] ? 1'b0 : layer3[3];
	assign layer4[4] = shiftamout[3] ? 1'b0 : layer3[4];
	assign layer4[5] = shiftamout[3] ? 1'b0 : layer3[5];
	assign layer4[6] = shiftamout[3] ? 1'b0 : layer3[6];
	assign layer4[7] = shiftamout[3] ? 1'b0 : layer3[7];
	assign layer4[8] = shiftamout[3] ? layer3[0] : layer3[8];
	assign layer4[9] = shiftamout[3] ? layer3[1] : layer3[9];
	assign layer4[10] = shiftamout[3] ? layer3[2] : layer3[10];
	assign layer4[11] = shiftamout[3] ? layer3[3] : layer3[11];
	assign layer4[12] = shiftamout[3] ? layer3[4] : layer3[12];
	assign layer4[13] = shiftamout[3] ? layer3[5] : layer3[13];
	assign layer4[14] = shiftamout[3] ? layer3[6] : layer3[14];
	assign layer4[15] = shiftamout[3] ? layer3[7] : layer3[15];
	assign layer4[16] = shiftamout[3] ? layer3[8] : layer3[16];
	assign layer4[17] = shiftamout[3] ? layer3[9] : layer3[17];
	assign layer4[18] = shiftamout[3] ? layer3[10] : layer3[18];
	assign layer4[19] = shiftamout[3] ? layer3[11] : layer3[19];
	assign layer4[20] = shiftamout[3] ? layer3[12] : layer3[20];
	assign layer4[21] = shiftamout[3] ? layer3[13] : layer3[21];
	assign layer4[22] = shiftamout[3] ? layer3[14] : layer3[22];
	assign layer4[23] = shiftamout[3] ? layer3[15] : layer3[23];
	assign layer4[24] = shiftamout[3] ? layer3[16] : layer3[24];
	assign layer4[25] = shiftamout[3] ? layer3[17] : layer3[25];
	assign layer4[26] = shiftamout[3] ? layer3[18] : layer3[26];
	assign layer4[27] = shiftamout[3] ? layer3[19] : layer3[27];
	assign layer4[28] = shiftamout[3] ? layer3[20] : layer3[28];
	assign layer4[29] = shiftamout[3] ? layer3[21] : layer3[29];
	assign layer4[30] = shiftamout[3] ? layer3[22] : layer3[30];
	assign layer4[31] = shiftamout[3] ? layer3[23] : layer3[31];
		
	//fifth layer
	assign out[0] = shiftamout[4] ? 1'b0 : layer4[0];
	assign out[1] = shiftamout[4] ? 1'b0 : layer4[1];
	assign out[2] = shiftamout[4] ? 1'b0 : layer4[2];
	assign out[3] = shiftamout[4] ? 1'b0 : layer4[3];
	assign out[4] = shiftamout[4] ? 1'b0 : layer4[4];
	assign out[5] = shiftamout[4] ? 1'b0 : layer4[5];
	assign out[6] = shiftamout[4] ? 1'b0 : layer4[6];
	assign out[7] = shiftamout[4] ? 1'b0 : layer4[7];
	assign out[8] = shiftamout[4] ? 1'b0 : layer4[8];
	assign out[9] = shiftamout[4] ? 1'b0 : layer4[9];
	assign out[10] = shiftamout[4] ? 1'b0 : layer4[10];
	assign out[11] = shiftamout[4] ? 1'b0 : layer4[11];
	assign out[12] = shiftamout[4] ? 1'b0 : layer4[12];
	assign out[13] = shiftamout[4] ? 1'b0 : layer4[13];
	assign out[14] = shiftamout[4] ? 1'b0 : layer4[14];
	assign out[15] = shiftamout[4] ? 1'b0 : layer4[15];
	assign out[16] = shiftamout[4] ? layer4[0] : layer4[16];
	assign out[17] = shiftamout[4] ? layer4[1] : layer4[17];
	assign out[18] = shiftamout[4] ? layer4[2] : layer4[18];
	assign out[19] = shiftamout[4] ? layer4[3] : layer4[19];
	assign out[20] = shiftamout[4] ? layer4[4] : layer4[20];
	assign out[21] = shiftamout[4] ? layer4[5] : layer4[21];
	assign out[22] = shiftamout[4] ? layer4[6] : layer4[22];
	assign out[23] = shiftamout[4] ? layer4[7] : layer4[23];
	assign out[24] = shiftamout[4] ? layer4[8] : layer4[24];
	assign out[25] = shiftamout[4] ? layer4[9] : layer4[25];
	assign out[26] = shiftamout[4] ? layer4[10] : layer4[26];
	assign out[27] = shiftamout[4] ? layer4[11] : layer4[27];
	assign out[28] = shiftamout[4] ? layer4[12] : layer4[28];
	assign out[29] = shiftamout[4] ? layer4[13] : layer4[29];
	assign out[30] = shiftamout[4] ? layer4[14] : layer4[30];
	assign out[31] = shiftamout[4] ? layer4[15] : layer4[31];

	
	
	
endmodule




















