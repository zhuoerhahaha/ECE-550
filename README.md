Zhuoer Li   zl328
Ching-Hang Hsu ch450

For the PC part, we follow the instruction provided on the sakkai, and give the 12 bit for our PC.
Additionally, whenever the clock meets the positive edge, it would add 12'd1 to the address of instruction memory.
Also, if there is a reset signal in the positive edge, the address of instruction memory will be set as 12'b0.

For the part of clock, there are four different kinds of clock for these specific elements: processor, instruction memory, data memory, register file.
processor: 1/4 of the master clock.
instruction memory: inverted clock.
data memory: inverted clock.
register file: 1/2 of the master clock. 

We use control.v to generate all of our control bits. In control.v, we first determine the logic of Rtype Instruction, addi, lw, and sw. Then we determine DMwe, Rwe, Rwd, Rdst and ALUinB based on our previous result.

We use sign_extend to generate the sign extended bits coming out of q_imem.

Then we used a mux to select the data into ALU port B and opcode. We use the provided alu to calculate the result.

Finally, we use a bunch of muxes to select the final write back data into the register and the destination register address(accounting for $r0 and $r30 if overflow).

We did see some issues in our code. Each time at least two consecutive lw instruction are performed, the program is gonna execute part of the last lw instruction first, the first several lw instructions following the last lw instruction, and then the remaining part of the last lw instruction. We suspect that it is caused by the gate delay of our overall design.