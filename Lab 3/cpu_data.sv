// ADDI Rd, Rn, Imm12: Reg[Rd] = Reg[Rn] + ZeroExtend(Imm12).
// ADDS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] + Reg[Rm]. Set flags.
// AND Rd, Rn, Rm: Reg[Rd] = Reg[Rn] & Reg[Rm].
// B Imm26: PC = PC + SignExtend(Imm26 << 2).
// For lab #4 (only) this instr. has a delay slot.
// B.LT Imm19: If (flags.negative != flags.overflow) PC = PC + SignExtend(Imm19<<2).
// For lab #4 (only) this instr. has a delay slot.
// CBZ Rd, Imm19: If (Reg[Rd] == 0) PC = PC + SignExtend(Imm19<<2).
// For lab #4 (only) this instr. has a delay slot.
// EOR Rd, Rn, Rm: Reg[Rd] = Reg[Rn] ^ Reg[Rm].
// LDUR Rd, [Rn, #Imm9]: Reg[Rd] = Mem[Reg[Rn] + SignExtend(Imm9)].
// For lab #4 (only) the value in rd cannot be used in the next cycle.
// LSR Rd, Rn, Shamt: Reg[Rd] = Reg[Rn] >> Shamt
// STUR Rd, [Rn, #Imm9]: Mem[Reg[Rn] + SignExtend(Imm9)] = Reg[Rd].
// SUBS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] - Reg[Rm]. Set flags.

module cpu_data (instruction, clk, Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, 
	BrTaken, MemtoReg, aluSrc, alu_cntrl, setFlags, reset, negative_reg, zero_reg, overflow_reg, carry_out_reg, zero);
	
	input logic clk, Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, BrTaken, MemtoReg, setFlags, reset;
	input logic [1:0] aluSrc;
	input logic [2:0] alu_cntrl; //aluop
	output logic negative_reg, zero_reg, overflow_reg, carry_out_reg, zero;
	output logic [31:0] instruction;
	
	logic disconnect1, disconnect2;
	logic [4:0] Rm, Rn, Rd;
	logic [5:0] shamt;
	logic [11:0] alu_12;
	logic [8:0] dt_address;
	logic [1:0] op;
	logic [25:0] br_address;
	logic [18:0] cond_br_address;
	// assigning vals to different parts of instruction
	assign Rm = instruction[20:16];
	assign Rn = instruction[9:5];
	assign Rd = instruction[4:0];
	assign shamt = instruction[15:10];
	assign alu_12 = instruction[21:10];
	
	assign dt_address = instruction[20:12]; //imm9
	assign op = instruction[11:10];
	assign br_address = instruction[25:0]; //imm26
	assign cond_br_address = instruction[23:5]; //imm19
	
	
	logic [63:0] PC, new_PC, selected_br_address, pc_adder_out, standard_pc; 
	
	// vals based off of instruction format	
	logic negative, overflow, carry_out;
	logic [4:0] ReadRegister2;
	logic [63:0] DataA, DataB, WriteData, alu_in, alu_result, mem_out, shifter_out;
	logic [63:0] alu_src_in [3:0];

	//shifter for LSR
	shifter LSR_shifter (.value(DataA), .direction(1'b1), .distance(shamt), .result(shifter_out));
	
	// alu_src 
	assign alu_src_in[0] = DataB;// pass B
	assign alu_src_in[1] = {{55{dt_address[8]}}, dt_address}; // dt_address/ imm9 SE 
	assign alu_src_in[2] = {52'b0, alu_12};// alu_12 ZE
	assign alu_src_in[3] = shifter_out;// LSR shifter result
	mux4to1 alu_src(.in(alu_src_in), .sel(aluSrc), .out(alu_in));
	
	//alu flags negative, zero, overflow, carry_out
	register_1bit neg_bit(.q(negative_reg), .d(negative), .wr_en(setFlags), .reset, .clk);
	register_1bit zer_bit(.q(zero_reg), .d(zero), .wr_en(setFlags), .reset, .clk);
	register_1bit ove_bit(.q(overflow_reg), .d(overflow), .wr_en(setFlags), .reset, .clk);
	register_1bit car_bit(.q(carry_out_reg), .d(carry_out), .wr_en(setFlags), .reset, .clk);
	
	// Reg2loc
	mux2to1_5bit reg2loc (.a(Rd), .b(Rm), .sel(Reg2loc), .out(ReadRegister2)); // selects whether Rd or Rm goes in Ab/ ReadRegister2

	
	// PC logic
	mux2to1_64bit uncondbr(.a({{38{br_address[25]}}, br_address}), .b({{45{cond_br_address[18]}}, cond_br_address}), .sel(UncondBr), .out(selected_br_address));
	adder_64bit pc_adder(.a({selected_br_address[61:0], 2'b0}), .b(PC), 
	.ci(1'b0), .co(disconnect1), .sum(pc_adder_out));
	adder_64bit standardPC(.a(64'd4), .b(PC), .ci(1'b0), .co(disconnect2), .sum(standard_pc));
	mux2to1_64bit brtaken(.a(standard_pc), .b(pc_adder_out), .sel(BrTaken), .out(new_PC));
	register pc_reg(.d(new_PC), .q(PC), .wr_en(1'b1), .reset, .clk);

	
	instructmem instructionmemory(.address(PC), .instruction, .clk);
	
	regfile registers(.ReadData1(DataA), .ReadData2(DataB), .WriteData, 
	.ReadRegister1(Rn), .ReadRegister2, .WriteRegister(Rd), .RegWrite, .clk);
	
	alu alumod(.A(DataA), .B(alu_in), .cntrl(alu_cntrl), .result(alu_result), .negative, .zero, .overflow, .carry_out); // most alu usage
	
	datamem datamemory(.address(alu_result), .write_enable(MemWrite), .read_enable(MemRead), 
	.write_data(DataB), .clk, .xfer_size(4'd8), .read_data(mem_out)); 
	
	//controls regfile write data
	mux2to1_64bit memtoreg(.a(alu_result), .b(mem_out), .sel(MemtoReg), .out(WriteData));
endmodule