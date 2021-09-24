# ECE-550
First project is ALU
# Name and NetId
Ching-Hang Hsu, ch450
Zhuoer Li, zl328
# Design Implementation: 
In my code, alu.v always call CheckADDSub to ensure that the module will either do ADD or do SUBTRACT.
As the part of "ADD", I used 3 RCA, which is comprised mainly of 16 Full-Adder, with the ternary syntax to build a 32 bit CSA.
As the part of "SUBTRACT",  I used XOR gate with the ctrl_ALUopcode[0] to successfully do the operation of NOT without using "!", and assign cin with mode, which is 1 in SUBTRACT.
        ex: xor xor_bit0(bit[0], B[0], mode);  // bit[0] is the bit after doing operation, B[0] is a bit of data_operandB, mode is ctrl_ALUopcode[0].
As the part of "OVERFLOW", I also used XOR gate with the last two carry-out to determine whether the operation is overflow or not. 
Inside the AND and OR module. We go to each bit to do the AND and OR operation(ie: and(a[0], b[0], out[0])) and put the result into the corresponding variable.
In side the SLL and SRA module, we use 5 layers of 2 to 1 muxes. Each layer contains 32 muxes, which shift 1, 2, 4, 8, and 16 bits correspondingly. Each i layer of muxes has a select bit of shiftamount[i].
Inside the IsLessthan module, we used 4 decoder to select the output bit(either 0 or 1). The design is in decoder.pdf
As whole, we used several 2 to 1 muxes to select the output based on the opcode given to us. The decision hierarchical decoder trees are shown in decoder.pdf
