/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;            //the actual instruction

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
	 
    wire DMwe, Rwe, Rwd, Rdst, ALUinB, is_Rtype, is_addi, is_sw, is_lw, is_equal, is_lessthan, ove;
    wire[31:0] sx;                                         //sign extended immediate 
    wire[31:0] aluout;                                     //output of alu
    wire[31:0] data_writeBack;
    wire[4:0] opcode;
    wire[31:0] pc_in, pc_out;
    //some pc
    pc mypc1(.clock(clock), .reset(reset), .pc_in(32'd0), .pc_out(pc_out)); 
    
    assign opcode = q_imem[31:27];
    control control_signal(opcode, DMwe, Rwe, Rwd, Rdst, ALUinB, is_Rtype, is_addi, is_sw, is_lw); 
    
    sign_extend extending(q_imem[15:0], sx);
    
    wire[4:0] ALUop = is_Rtype ? opcode : q_imem[6:2];
    wire[4:0] shamt = is_Rtype ? 5'b0 : q_imem[11:7];
    
    assign data_readB = ALUinB ? sx : data_readRegB;         //select data to feed into ALU_B
    
    
    //alu module alu(data_operandA, data_operandB, ctrl_ALUopcode,
        //ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
    alu myalu(data_readRegA, data_readB, ALUop, shamt, aluout, is_equal, is_lessthan, ove);
    
    //dmem
    assign data = data_readRegB;                       //only needed in sw, feed regB into data
    assign wren = DMwe;
    assign address_dmem =  aluout[11:0]                //?

    //writeback
    assign data_writeBack = Rwd ? q_dmem : aluout;        //select from dmem when write_back is 0; slect from alu when it's r_type or addi
    assign ctrl_writeEnable = Rwe;
    assign address_writeback = q_imem[26:22];     //rd
    assign ctrl_writeReg = ove ? 32'd30 : address_writeback;
    assign ctrl_readRegA = q_imem[21:17];                            //rs
    assign ctrl_readRegB = q_imem[16:12];                            // 

    //handle the $r30 & $r0
    thing1[31:0] = ALUop[0] ? 32'd2 : 32'd1;
    thing2[31:0] = is_Rtype ? thing1 : 32'd3;
    thing3[31:0] = ove ? thing2 : data_writeBack;
    wire r0 = ctrl_writeReg[4] ? 1 : ctrl_writeReg[3] ? 1 : ctrl_writeReg[2]? 1 : ctrl_writeReg[1]? 1 : ctrl_writeReg[0]? 1 : 0;
    data_writeReg = r0 ? thing3 : 32'd0;
endmodule