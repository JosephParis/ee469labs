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

module cpu_top (clk, reset);
	input logic clk, reset;
	logic Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, BrTaken, MemtoReg, setFlags;
	logic negative_reg, zero_reg, overflow_reg, carry_out_reg, zero;
	logic [1:0] aluSrc;
	logic [2:0] alu_cntrl; //aluop
	logic [31:0] instruction;

	cpu_data data(.instruction, .clk, .Reg2loc, .RegWrite, .MemWrite, .MemRead, .UncondBr, .BrTaken, .MemtoReg, 
	.aluSrc, .alu_cntrl, .setFlags, .reset, .negative_reg, .zero_reg, .overflow_reg, .carry_out_reg, .zero);
	cpu_cntrl control(.instruction, .clk, .Reg2loc, .RegWrite, .MemWrite, .MemRead, .UncondBr, .BrTaken, .MemtoReg, 
	.aluSrc, .alu_cntrl, .setFlags, .negative_reg, .zero_reg, .overflow_reg, .carry_out_reg, .zero);
endmodule