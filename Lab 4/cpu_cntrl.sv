// I ADDI Rd, Rn, Imm12: Reg[Rd] = Reg[Rn] + ZeroExtend(Imm12).
// R ADDS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] + Reg[Rm]. Set flags.
// R AND Rd, Rn, Rm: Reg[Rd] = Reg[Rn] & Reg[Rm].
// B B Imm26: PC = PC + SignExtend(Imm26 << 2).
// For lab #4 (only) this instr. has a delay slot.
// CB B.LT Imm19: If (flags.negative != flags.overflow) PC = PC + SignExtend(Imm19<<2).
// For lab #4 (only) this instr. has a delay slot.
// CB CBZ Rd, Imm19: If (Reg[Rd] == 0) PC = PC + SignExtend(Imm19<<2).
// For lab #4 (only) this instr. has a delay slot.
// R EOR Rd, Rn, Rm: Reg[Rd] = Reg[Rn] ^ Reg[Rm].
// D LDUR Rd, [Rn, #Imm9]: Reg[Rd] = Mem[Reg[Rn] + SignExtend(Imm9)].
// For lab #4 (only) the value in rd cannot be used in the next cycle.
// R LSR Rd, Rn, Shamt: Reg[Rd] = Reg[Rn] >> Shamt
// D STUR Rd, [Rn, #Imm9]: Mem[Reg[Rn] + SignExtend(Imm9)] = Reg[Rd].
// R SUBS Rd, Rn, Rm: Reg[Rd] = Reg[Rn] - Reg[Rm]. Set flags.


module cpu_cntrl (instruction, clk, Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, BrTaken, MemtoReg, 
aluSrc, alu_cntrl, setFlags, negative_reg, zero_reg, overflow_reg, carry_out_reg, zero, instr_type);
	input logic clk, negative_reg, zero_reg, overflow_reg, carry_out_reg, zero;
	input logic [31:0] instruction;
	output logic Reg2loc, RegWrite, MemWrite, MemRead, UncondBr, BrTaken, MemtoReg, setFlags;
	output logic [1:0] aluSrc, instr_type;
	output logic [2:0] alu_cntrl; //aluop

    // smaller opcodes
	 logic [10:0] opcode_11bit;
    logic [9:0]  opcode_10bit;
    logic [7:0]  opcode_8bit;
    logic [5:0]  opcode_6bit;
	 assign opcode_11bit = instruction[31:21];
    assign opcode_10bit = instruction[31:22];
    assign opcode_8bit  = instruction[31:24];
    assign opcode_6bit  = instruction[31:26];
    
    always_comb begin
        // Default values
		  Reg2loc = 1;
		  RegWrite = 1;
		  MemWrite = 0;
        MemRead = 0;
		  UncondBr = 1;
        BrTaken = 0;
		  MemtoReg = 0;
		  aluSrc = 2'b00;
        alu_cntrl = 3'b000;
		  setFlags = 0;
		  instr_type = 2'b11;
        case (opcode_6bit)
			 6'b000101: begin // B (unconditional branch)
				  RegWrite = 0;
				  UncondBr = 0;
				  BrTaken = 1;
				  instr_type = 2'b00;
			 end
				 
			default: begin
				  case (opcode_8bit)
						8'b10110100: begin // CBZ
						  Reg2loc = 0;
						  RegWrite = 0;
						  //BrTaken = zero; // zero flag
						  BrTaken = 1; // rework
						  instr_type = 2'b01;
						end
						
						8'b01010100: begin // B.LT (conditional branch)
							 if (instruction[3:0] == 4'b1011) begin // Check condition bits
										  RegWrite = 0;
										  //BrTaken = (negative_reg != overflow_reg); // set flags negative != overflow
										  BrTaken = 1; // rework
										  instr_type = 2'b00;
							 end
						end
						
						default: begin
							 case (opcode_10bit)
								  10'b1001000100: begin // ADDI
										aluSrc = 2'b10;
										alu_cntrl = 3'b010; // set to add
										instr_type = 2'b10;
								  end
								  
								  10'b1101001101: begin // LSR
										aluSrc = 2'b11;
										instr_type = 2'b10;
								  end
								  
								  default: begin
										case (opcode_11bit)
											11'b10101011000: begin // ADDS
												setFlags = 1;
												alu_cntrl = 3'b010; // set to add
											end
											 
											11'b10001010000: begin // AND
												alu_cntrl = 3'b100; // set to and
											end

											11'b11001010000: begin // EOR
												alu_cntrl = 3'b110; // set to xor
											end

											11'b11111000010: begin // LDUR
												MemRead = 1;
												MemtoReg = 1;
												aluSrc = 2'b01;
												alu_cntrl = 3'b010; // set to add
												instr_type = 2'b10;
											end

											11'b11111000000: begin // STUR
												Reg2loc = 0;
												RegWrite = 0;
												MemWrite = 1;
												aluSrc = 2'b01;
												alu_cntrl = 3'b010; // set to add
												instr_type = 2'b10;
											end

											11'b11101011000: begin // SUBS
												setFlags = 1;
												alu_cntrl = 3'b011; // set to sub
											end
                            
                            default: begin
										Reg2loc = 1;
										RegWrite = 1;
										MemWrite = 0;
										MemRead = 0;
										UncondBr = 1;
										BrTaken = 0;
										MemtoReg = 0;
										aluSrc = 2'b00;
										alu_cntrl = 3'b000;
										setFlags = 0;
										instr_type = 2'b00;
										$display("Unknown opcode: %b", instruction[31:21]);
										 end
									endcase
							  end
						 endcase
					end
			  endcase
			end
		endcase
	end
endmodule