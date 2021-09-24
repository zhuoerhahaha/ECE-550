module ALU(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	
   // YOUR CODE HERE //
	wire[31:0] add_sub_result, and_result, or_result, leftshift, rightshift, sub_result;
	wire nothing;

	//add-sub
	CheckAddSub calculate0(.A(data_operandA), .B(data_operandB), .mode(ctrl_ALUopcode[0]), .D(add_sub_result), .overflow(overflow));
	
	//and
	bit_And and0(data_operandA, data_operandB, and_result);
	
	//or
	bit_Or or0(data_operandA, data_operandB, or_result);
	
	//left and right shift
	left_shift shift0(data_operandA, ctrl_shiftamt, leftshift);
	right_shift shift1(data_operandA, ctrl_shiftamt, rightshift);
	
	//is not equal
	is_not_equal ine0(data_operandA, data_operandB, isNotEqual);
	
	//subtract
	CheckAddSub calculate1(.A(data_operandA), .B(data_operandB), .mode(1'b1), .D(sub_result), .overflow(nothing));
	//less than
	assign isLessThan = isNotEqual ? (nothing ? (data_operandA[31] ? 1'b1 : 1'b0) : (sub_result[31] ? 1'b1 : 1'b0)) : 1'b0;
	
	
	//assign result
	assign data_result = ctrl_ALUopcode[2] ? (ctrl_ALUopcode[0] ? rightshift : leftshift) : (ctrl_ALUopcode[1] ? (ctrl_ALUopcode[0] ? or_result : and_result) : add_sub_result);
	
	
	
	

endmodule