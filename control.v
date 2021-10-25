module control(opcode, DMwe, Rwe, Rwd, Rdst, ALUinB, is_Rtype, is_addi, is_lw, is_sw);
	input[4:0] opcode;
	output DMwe, Rwe, Rwd, Rdst, ALUinB, is_Rtype, is_addi, is_lw, is_sw;
	
	assign is_Rtype = ~opcode[4] && ~opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0];
	assign is_addi = ~opcode[4] && ~opcode[3] && opcode[2] && ~opcode[1] && opcode[0];
	assign is_lw = ~opcode[4] && opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0];
	assign is_sw = ~opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && opcode[0];
	
	assign DMwe = is_sw;          
	assign Rwe = is_Rtype || is_addi || is_lw;
	assign Rwd = is_lw;         //rwd == 0 for lw, 1 for r_type & i_type
	assign Rdst = is_Rtype;     //rdst == 1 when R type is performed
	assign ALUinB = ~is_Rtype;   //aluinb == 0 when r type is performed(select data from regfile instead of constant)
	
	
endmodule
	