module regfile(clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	//dffe_ref flipflop0(q, d, clk, en, rst);
	
	wire[31:0] writeRegOut;
	wire[31:0] writeRegEnable;
	wire [31:0] memory [0:31];
	wire[31:0] readRegOutA, readRegOutB;
	
	dec5to32 dec0(ctrl_writeReg, writeRegOut);
	
	multipleAND AND0(writeRegOut, writeRegEnable, ctrl_writeEnable);

	genvar i;
		generate
		for(i = 0; i < 32; i = i + 1) begin: writetoFlipFlop
			dffe_ref flipflop(memory[i], data_writeReg, clock, writeRegEnable[i], ctrl_reset);
		end
	endgenerate
	
	dec5to32 dec1(ctrl_readRegA, readRegOutA);
	assign data_readRegA = readRegOutA[0] ? memory[0] :
									 readRegOutA[1] ? memory[1] :
									 readRegOutA[2] ? memory[2] :
									 readRegOutA[3] ? memory[3] :
									 readRegOutA[4] ? memory[4] :
									 readRegOutA[5] ? memory[5] :
									 readRegOutA[6] ? memory[6] :
									 readRegOutA[7] ? memory[7] :
									 readRegOutA[8] ? memory[8] :
									 readRegOutA[9] ? memory[9] :
									 readRegOutA[10] ? memory[10] :
									 readRegOutA[11] ? memory[11] :
									 readRegOutA[12] ? memory[12] :
									 readRegOutA[13] ? memory[13] :
									 readRegOutA[14] ? memory[14] :
									 readRegOutA[15] ? memory[15] :
									 readRegOutA[16] ? memory[16] :
									 readRegOutA[17] ? memory[17] :
									 readRegOutA[18] ? memory[18] :
									 readRegOutA[19] ? memory[19] :
									 readRegOutA[20] ? memory[20] :
									 readRegOutA[21] ? memory[21] :
									 readRegOutA[22] ? memory[22] :
									 readRegOutA[23] ? memory[23] :
									 readRegOutA[24] ? memory[24] :
									 readRegOutA[25] ? memory[25] :
									 readRegOutA[26] ? memory[26] :
									 readRegOutA[27] ? memory[27] :
									 readRegOutA[28] ? memory[28] :
									 readRegOutA[29] ? memory[29] :
									 readRegOutA[30] ? memory[30] :
									 readRegOutA[31] ? memory[31] : 32'b0;
									 

dec5to32 dec2(ctrl_readRegB, readRegOutB);
	assign data_readRegB = readRegOutB[0] ? memory[0] :
									 readRegOutB[1] ? memory[1] :
									 readRegOutB[2] ? memory[2] :
									 readRegOutB[3] ? memory[3] :
									 readRegOutB[4] ? memory[4] :
									 readRegOutB[5] ? memory[5] :
									 readRegOutB[6] ? memory[6] :
									 readRegOutB[7] ? memory[7] :
									 readRegOutB[8] ? memory[8] :
									 readRegOutB[9] ? memory[9] :
									 readRegOutB[10] ? memory[10] :
									 readRegOutB[11] ? memory[11] :
									 readRegOutB[12] ? memory[12] :
									 readRegOutB[13] ? memory[13] :
									 readRegOutB[14] ? memory[14] :
									 readRegOutB[15] ? memory[15] :
									 readRegOutB[16] ? memory[16] :
									 readRegOutB[17] ? memory[17] :
									 readRegOutB[18] ? memory[18] :
									 readRegOutB[19] ? memory[19] :
									 readRegOutB[20] ? memory[20] :
									 readRegOutB[21] ? memory[21] :
									 readRegOutB[22] ? memory[22] :
									 readRegOutB[23] ? memory[23] :
									 readRegOutB[24] ? memory[24] :
									 readRegOutB[25] ? memory[25] :
									 readRegOutB[26] ? memory[26] :
									 readRegOutB[27] ? memory[27] :
									 readRegOutB[28] ? memory[28] :
									 readRegOutB[29] ? memory[29] :
									 readRegOutB[30] ? memory[30] :
									 readRegOutB[31] ? memory[31] : 32'b0;
	
	
endmodule

