module ALU(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
   // YOUR CODE HERE //
	wire[31:0] bout, notb, add_sub_result, and_result, or_result, leftshift, rightshift;
	
	//negate operand_B
	negateb negateb0(data_operandB, notb);
	
	//2-1 mux
	assign bout = ctrl_ALUopcode[0] ? notb : data_operandB;     //correct way to select?
	
	//csa
	CSA csa0(data_operandA, bout, ctrl_ALUopcode, overflow, add_sub_result);
	
	//and
	bit_And and0(data_operandA, data_operandB, and_result);
	
	//or
	bit_Or or0(data_operandA, data_operandB, or_result);
	
	//left and right shift
	left_shift shift0(data_operandA, ctrl_shiftamt, leftshift);
	right_shift shift1(data_operandA, ctrl_shiftamt, rightshift);
	
	
	assign data_result = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? rightshift : leftshift) : (ctrl_ALUopcode[1] ? (ctrl_ALUopcode[0] ? or_result : and_result) : add_sub_result);
	
	
	
	

endmodule