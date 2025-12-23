// ADDI Rd, Rn, Imm12: Reg[Rd] = Reg[Rn] + ZeroExtend(Imm12).
// ADDS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] + Reg[Rm]. Set flags.
// AND Rd, Rn, Rm: Reg[Rd] = Reg[Rn] & Reg[Rm].
// B Imm26: PC = PC + SignExtend(Imm26 << 2).
// B.LT Imm19: If (flags.negative != flags.overflow) PC = PC + SignExtend(Imm19<<2).
// CBZ Rd, Imm19: If (Reg[Rd] == 0) PC = PC + SignExtend(Imm19<<2).
// EOR Rd, Rn, Rm: Reg[Rd] = Reg[Rn] ^ Reg[Rm].
// LDUR Rd, [Rn, #Imm9]: Reg[Rd] = Mem[Reg[Rn] + SignExtend(Imm9)].
// LSR Rd, Rn, Shamt: Reg[Rd] = Reg[Rn] >> Shamt
// STUR Rd, [Rn, #Imm9]: Mem[Reg[Rn] + SignExtend(Imm9)] = Reg[Rd].
// SUBS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] - Reg[Rm]. Set flags.

module cpu_data (instruction1, clk, Reg2loc, RegWrite, MemWrite, 
	MemRead, UncondBr, BrTaken, MemtoReg, aluSrc, alu_cntrl, setFlags, reset, negative_reg, 
	zero_reg, overflow_reg, carry_out_reg, zero, instr_type);
	
	input logic clk, Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, BrTaken, MemtoReg, setFlags, reset;
	input logic [1:0] aluSrc, instr_type;
	input logic [2:0] alu_cntrl;
	output logic negative_reg, zero_reg, overflow_reg, carry_out_reg, zero;
	output logic [31:0] instruction1;
	
	
	logic [31:0] instruction; 
	logic disconnect1, disconnect2;
	logic [4:0] Rm0, Rm1, Rn0, Rn1, Rd0, Rd1, Rd2, Rd3;
	logic [5:0] shamt0, shamt1;
	logic [11:0] alu_12_0, alu_12_1;
	logic [8:0] dt_address0, dt_address1;
	logic [25:0] br_address;
	logic [18:0] cond_br_address;
	logic [63:0] PC, new_PC, selected_br_address, pc_adder_out, standard_pc, PC_reg; 
	
	logic negative, overflow, carry_out;
	logic [4:0] ReadRegister2;
	logic [63:0] DataA, DataB, WriteData, alu_in, alu_result, mem_out, shifter_out;
	logic [63:0] DataA_reg, DataB_reg, alu_result_reg, DataB_reg1, WriteData_reg;
	logic [63:0] DataB_exe_fwd, DataA_exe_fwd, memData_fwd, DataB_cbz;
	logic [63:0] alu_src_in [3:0];
	
	//cntrl signals
	logic Reg2Loc_reg1, RegWrite_reg1, MemWrite_reg1, MemRead_reg1, MemtoReg_reg1, setFlags_reg1;
	logic [1:0] aluSrc_reg1, instr_type_reg1;
	logic [2:0] alu_cntrl_reg1;
	logic RegWrite_reg2, MemWrite_reg2, MemRead_reg2, MemtoReg_reg2;
	logic [1:0] instr_type_reg2;
	logic RegWrite_reg3;
	logic [1:0] instr_type_reg3;
	
	logic ble_condition, cbz_condition, cbz_taken, ble_taken, cb_instr;
	logic br_actually_taken, cbz_actually_taken, ble_actually_taken;
	logic [63:0] cbz_forwarding_values [3:0];
	logic [1:0] cbz_forwarding_sel, cbz_forwarding_sel_equals;

	// INSTRUCTION FETCH
	instructmem instructionmemory(.address(PC), .instruction, .clk);
	register_nbit #(.n(32)) IF_DEC_instr_reg (.d(instruction), .q(instruction1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(64)) IF_DEC_PC_reg (.d(PC), .q(PC_reg), .wr_en(1'b1), .reset, .clk);
	
	// READ REGISTERS/ DECODE
	assign Rm0 = instruction1[20:16];
	assign Rn0 = instruction1[9:5];
	assign Rd0 = instruction1[4:0];
	assign br_address = instruction1[25:0];
	assign cond_br_address = instruction1[23:5];
	assign shamt0 = instruction1[15:10];
	assign alu_12_0 = instruction1[21:10];
	assign dt_address0 = instruction1[20:12];
	
	mux2to1_5bit reg2loc (.a(Rd0), .b(Rm0), .sel(Reg2loc), .out(ReadRegister2));
	
	regfile registers(.ReadData1(DataA), .ReadData2(DataB), .WriteData(WriteData_reg), 
	.ReadRegister1(Rn0), .ReadRegister2, .WriteRegister(Rd3), .RegWrite(RegWrite_reg3), .clk(~clk));
	
	// BRANCH LOGIC
	// CBZ requires current Rd so that we can check 0 flag correctly	
	// Forwarding logic for Rd for comparing CBZ branch
	// Need to forward from MEM (Rd2) and WB (Rd3) stages to DECODE (Rd0)
	logic  Rd1_is_x31, Rd2_is_x31, Rd3_is_x31, Rd1_not_x31, Rd2_not_x31, Rd3_not_x31;
	
	equals #(.N(5)) Rd1_x31_check (.a(Rd1), .b(5'b11111), .equal(Rd1_is_x31));
	equals #(.N(5)) Rd2_x31_check (.a(Rd2), .b(5'b11111), .equal(Rd2_is_x31));
	equals #(.N(5)) Rd3_x31_check (.a(Rd3), .b(5'b11111), .equal(Rd3_is_x31));
	
	not Rd1_x31_not (Rd1_not_x31, Rd1_is_x31);
	not Rd2_x31_not (Rd2_not_x31, Rd2_is_x31);
	not Rd3_x31_not (Rd3_not_x31, Rd3_is_x31);
	
	assign cbz_forwarding_values[0] = DataB;
	assign cbz_forwarding_values[1] = alu_result;  // forward ALU result from MEM stage
	assign cbz_forwarding_values[2] = alu_result_reg;   // forward from WB stage changed from Writedata_reg
	assign cbz_forwarding_values[3] = alu_result;
	
	equals #(.N(5)) cbz_forwarding_sel_equals1 (.a(Rd0), .b(Rd1), .equal(cbz_forwarding_sel_equals[0])); // Rd0 == Rd1 (MEM stage) prv Rd2
	equals #(.N(5)) cbz_forwarding_sel_equals2 (.a(Rd0), .b(Rd2), .equal(cbz_forwarding_sel_equals[1])); // Rd0 == Rd2 (WB stage) prev Rd3
	
	and cbz_forwarding_sel_and1 (cbz_forwarding_sel[0], RegWrite_reg1, cbz_forwarding_sel_equals[0], Rd1_not_x31); //2-1
	and cbz_forwarding_sel_and2 (cbz_forwarding_sel[1], RegWrite_reg2, cbz_forwarding_sel_equals[1], Rd2_not_x31); // 3-2
	
	mux4to1 cbz_forwarding_mux (.in(cbz_forwarding_values), .sel(cbz_forwarding_sel), .out(DataB_cbz));

	
	// Branch decision logic - DECODE STAGE
	logic negative_fwd, overflow_fwd;

	// Forward flags from EXE stage if the instruction there is setting flags
	mux2to1 negative_fwd_mux (.a(negative_reg), .b(negative), .sel(setFlags_reg1), .out(negative_fwd));
	mux2to1 overflow_fwd_mux (.a(overflow_reg), .b(overflow), .sel(setFlags_reg1), .out(overflow_fwd));
	
	//and negative_fwd_and (negative_fwd, setFlags_reg1, negative);
	//and overflow_fwd_and (overflow_fwd, setFlags_reg1, overflow);	
	// Use forwarded flags for branch conditions
	xor ble_xor (ble_condition, negative_fwd, overflow_fwd);
	equals #(.N(64)) cbz_equals (.a(DataB_cbz), .b(64'b0), .equal(cbz_condition));
	equals #(.N(2)) instr_equals (.a(instr_type), .b(2'b01), .equal(cb_instr));
	and ble_and (ble_taken, BrTaken, ble_condition);
	and cbz_and (cbz_taken, BrTaken, cbz_condition);
	and is_cb_instr(cbz_actually_taken, cb_instr, cbz_taken);
	and is_ble_instr(ble_actually_taken, ~cb_instr, ble_taken);
	or br_actually_taken_or (br_actually_taken, ~UncondBr, cbz_actually_taken, ble_actually_taken);
	
	// PC calculation - USE DECODE STAGE ADDRESSES AND PC
	mux2to1_64bit uncondbr(.a({{38{br_address[25]}}, br_address}), 
	    .b({{45{cond_br_address[18]}}, cond_br_address}), 
	    .sel(UncondBr), .out(selected_br_address));
	
	adder_64bit pc_adder(.a({selected_br_address[61:0], 2'b0}), .b(PC_reg), 
	    .ci(1'b0), .co(disconnect1), .sum(pc_adder_out));
	
	// Standard PC (from current PC)
	adder_64bit standardPC(.a(64'd4), .b(PC), .ci(1'b0), .co(disconnect2), .sum(standard_pc));

	// PC update - branch decision happens in DECODE, delay slot executes naturally
	mux2to1_64bit brtaken(.a(standard_pc), .b(pc_adder_out), .sel(br_actually_taken), .out(new_PC));
	register pc_reg(.d(new_PC), .q(PC), .wr_en(1'b1), .reset, .clk);
	
	
	register DEC_EXE_regA(.d(DataA), .q(DataA_reg), .wr_en(1'b1), .reset, .clk);
	register DEC_EXE_regB(.d(DataB), .q(DataB_reg), .wr_en(1'b1), .reset, .clk);
	
	// Pipeline instruction fields to EX stage
	register_nbit #(.n(5)) DEC_EXE_Rd_reg (.d(Rd0), .q(Rd1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(5)) DEC_EXE_Rm_reg (.d(Rm0), .q(Rm1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(5)) DEC_EXE_Rn_reg (.d(Rn0), .q(Rn1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(6)) DEC_EXE_shamt_reg (.d(shamt0), .q(shamt1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(12)) DEC_EXE_alu_12_reg (.d(alu_12_0), .q(alu_12_1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(9)) DEC_EXE_dt_address_reg (.d(dt_address0), .q(dt_address1), .wr_en(1'b1), .reset, .clk);
	
	//cntrl signals
	register_1bit DEC_EXE_Reg2Loc_reg (.d(Reg2loc), .q(Reg2Loc_reg1), .wr_en(1'b1), .reset, .clk);
	register_1bit DEC_EXE_RegWrite_reg (.d(RegWrite), .q(RegWrite_reg1), .wr_en(1'b1), .reset, .clk);
	register_1bit DEC_EXE_MemWrite_reg (.d(MemWrite), .q(MemWrite_reg1), .wr_en(1'b1), .reset, .clk);
	register_1bit DEC_EXE_MemRead_reg (.d(MemRead), .q(MemRead_reg1), .wr_en(1'b1), .reset, .clk);
	register_1bit DEC_EXE_MemtoReg_reg (.d(MemtoReg), .q(MemtoReg_reg1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(2)) DEC_EXE_instr_type_reg (.d(instr_type), .q(instr_type_reg1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(2)) DEC_EXE_aluSrc_reg (.d(aluSrc), .q(aluSrc_reg1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(3)) DEC_EXE_alu_cntrl_reg (.d(alu_cntrl), .q(alu_cntrl_reg1), .wr_en(1'b1), .reset, .clk);
	register_1bit DEC_EXE_setFlags_reg (.d(setFlags), .q(setFlags_reg1), .wr_en(1'b1), .reset, .clk);
	
	//EXECUTE - ALU
	logic check_Rm;
	logic [63:0] Rn_forwarding_values [3:0];
	logic [63:0] Rm_Rd_forwarding_values [3:0];
	logic [1:0] Rn_forwarding_sel, Rm_forwarding_sel_equals, Rd_forwarding_sel_equals;
	logic [1:0] Rm_forwarding_sel_and, Rd_forwarding_sel_and, Rm_Rd_forwarding_sel, Rn_forwarding_sel_equals;
	
	// Forwarding logic for ALU inputs
	equals #(.N(5)) Rm_forwarding_sel_equals1 (.a(Rm1), .b(Rd2), .equal(Rm_forwarding_sel_equals[0]));
	equals #(.N(5)) Rm_forwarding_sel_equals2 (.a(Rm1), .b(Rd3), .equal(Rm_forwarding_sel_equals[1]));
	equals #(.N(5)) Rd_forwarding_sel_equals1 (.a(Rd1), .b(Rd2), .equal(Rd_forwarding_sel_equals[0]));
	equals #(.N(5)) Rd_forwarding_sel_equals2 (.a(Rd1), .b(Rd3), .equal(Rd_forwarding_sel_equals[1]));
	
	and Rm_forwarding_instr (check_Rm, instr_type_reg1[1], instr_type_reg1[0]);
	and Rm_forwarding_sel_and1 (Rm_forwarding_sel_and[0], RegWrite_reg2, Rm_forwarding_sel_equals[0], check_Rm, Rd2_not_x31);
	and Rm_forwarding_sel_and2 (Rm_forwarding_sel_and[1], RegWrite_reg3, Rm_forwarding_sel_equals[1], check_Rm, Rd3_not_x31);
	and Rd_forwarding_sel_and1 (Rd_forwarding_sel_and[0], RegWrite_reg2, Rd_forwarding_sel_equals[0], MemWrite_reg1, Rd2_not_x31);
	and Rd_forwarding_sel_and2 (Rd_forwarding_sel_and[1], RegWrite_reg3, Rd_forwarding_sel_equals[1], MemWrite_reg1, Rd3_not_x31);
	assign Rm_Rd_forwarding_values[0] = DataB_reg;
	assign Rm_Rd_forwarding_values[1] = alu_result_reg;
	assign Rm_Rd_forwarding_values[2] = WriteData_reg;
	assign Rm_Rd_forwarding_values[3] = alu_result_reg;
	or Rm_Rd_forwarding_sel_or1 (Rm_Rd_forwarding_sel[1], Rd_forwarding_sel_and[1], Rm_forwarding_sel_and[1]);
	or Rm_Rd_forwarding_sel_or2 (Rm_Rd_forwarding_sel[0], Rd_forwarding_sel_and[0], Rm_forwarding_sel_and[0]);
	mux4to1 Rm_Rd_forwarding_mux (.in(Rm_Rd_forwarding_values), .sel(Rm_Rd_forwarding_sel), .out(DataB_exe_fwd));	
	
	equals #(.N(5)) Rn_forwarding_sel_equals1 (.a(Rn1), .b(Rd2), .equal(Rn_forwarding_sel_equals[0]));
	equals #(.N(5)) Rn_forwarding_sel_equals2 (.a(Rn1), .b(Rd3), .equal(Rn_forwarding_sel_equals[1]));
	and Rn_forwarding_sel_and1 (Rn_forwarding_sel[0], RegWrite_reg2, Rn_forwarding_sel_equals[0], Rd2_not_x31);
	and Rn_forwarding_sel_and2 (Rn_forwarding_sel[1], RegWrite_reg3, Rn_forwarding_sel_equals[1], Rd3_not_x31);
	assign Rn_forwarding_values[0] = DataA_reg;
	assign Rn_forwarding_values[1] = alu_result_reg;
	assign Rn_forwarding_values[2] = WriteData_reg;
	assign Rn_forwarding_values[3] = alu_result_reg;
	mux4to1 Rn_forwarding_mux (.in(Rn_forwarding_values), .sel(Rn_forwarding_sel), .out(DataA_exe_fwd));	
	
	
	//shifter for LSR
	shifter LSR_shifter (.value(DataA_exe_fwd), .direction(1'b1), .distance(shamt1), .result(shifter_out));
	
	// alu_src 
	assign alu_src_in[0] = DataB_exe_fwd;
	assign alu_src_in[1] = {{55{dt_address1[8]}}, dt_address1};
	assign alu_src_in[2] = {52'b0, alu_12_1};
	assign alu_src_in[3] = shifter_out;
	mux4to1 alu_src(.in(alu_src_in), .sel(aluSrc_reg1), .out(alu_in));
	
	alu alumod(.A(DataA_exe_fwd), .B(alu_in), .cntrl(alu_cntrl_reg1), .result(alu_result), .negative, .zero, .overflow, .carry_out);
	
	//alu flags
	register_1bit neg_bit(.d(negative), .q(negative_reg), .wr_en(setFlags_reg1), .reset, .clk);
	register_1bit zer_bit(.d(zero), .q(zero_reg), .wr_en(setFlags_reg1), .reset, .clk);
	register_1bit ove_bit(.d(overflow), .q(overflow_reg), .wr_en(setFlags_reg1), .reset, .clk);
	register_1bit car_bit(.d(carry_out), .q(carry_out_reg), .wr_en(setFlags_reg1), .reset, .clk);
	
	register EXE_MEM_regALU (.d(alu_result), .q(alu_result_reg), .wr_en(1'b1), .reset, .clk);
	register EXE_MEM_regB (.d(DataB_exe_fwd), .q(DataB_reg1), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(5)) EXE_MEM_Rd_reg (.d(Rd1), .q(Rd2), .wr_en(1'b1), .reset, .clk);
	
	//cntrl signals
	register_1bit EXE_MEM_RegWrite_reg (.d(RegWrite_reg1), .q(RegWrite_reg2), .wr_en(1'b1), .reset, .clk);
	register_1bit EXE_MEM_MemWrite_reg (.d(MemWrite_reg1), .q(MemWrite_reg2), .wr_en(1'b1), .reset, .clk);
	register_1bit EXE_MEM_MemRead_reg (.d(MemRead_reg1), .q(MemRead_reg2), .wr_en(1'b1), .reset, .clk);
	register_1bit EXE_MEM_MemtoReg_reg (.d(MemtoReg_reg1), .q(MemtoReg_reg2), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(2)) EXE_MEM_instr_type_reg (.d(instr_type_reg1), .q(instr_type_reg2), .wr_en(1'b1), .reset, .clk);

	//MEMORY
	logic mem_forwarding_sel_equals, mem_forwarding_sel;
	logic [63:0] mem_forwarding_values [1:0];
	
	equals #(.N(5)) mem_forwarding_sel_equalsop (.a(Rd2), .b(Rd3), .equal(mem_forwarding_sel_equals));
	and mem_forwarding_sel_and (mem_forwarding_sel, RegWrite_reg3, mem_forwarding_sel_equals, MemWrite_reg2, Rd3_not_x31);
	assign mem_forwarding_values[0] = DataB_reg1;
	assign mem_forwarding_values[1] = WriteData_reg;
	mux2to1_64bit mem_forwarding_mux (.a(mem_forwarding_values[0]), .b(mem_forwarding_values[1]), .sel(mem_forwarding_sel), .out(memData_fwd));	 
	
	datamem datamemory(.address(alu_result_reg), .write_enable(MemWrite_reg2), .read_enable(MemRead_reg2), 
	.write_data(memData_fwd), .clk, .xfer_size(4'd8), .read_data(mem_out)); 
	
	mux2to1_64bit memtoreg(.a(alu_result_reg), .b(mem_out), .sel(MemtoReg_reg2), .out(WriteData));
	
	register MEM_WRI_WriteData_reg (.d(WriteData), .q(WriteData_reg), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(5)) MEM_WRI_Rd_reg (.d(Rd2), .q(Rd3), .wr_en(1'b1), .reset, .clk);
	
	//cntrl signals
	register_1bit MEM_WRI_RegWrite_reg (.d(RegWrite_reg2), .q(RegWrite_reg3), .wr_en(1'b1), .reset, .clk);
	register_nbit #(.n(2)) MEM_WRI_instr_type_reg (.d(instr_type_reg2), .q(instr_type_reg3), .wr_en(1'b1), .reset, .clk);
endmodule


