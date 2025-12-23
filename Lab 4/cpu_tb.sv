
`timescale 1ns/1ps

module cpu_tb();
    logic clk, reset;
    integer cycle_count;
	 logic [63:0] prev_pc, prev_prev_pc;
    logic pc_stuck;
    
    cpu_top dut (.clk, .reset);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        cycle_count = 0;
        pc_stuck = 0;
		  prev_pc = 0;
		  prev_prev_pc = 0;
		  
        reset = 1;
        repeat(3) @(posedge clk);
        reset = 0;
        $display("reset done, starting\n");
        
        // Run until PC stops changing or reaches max cycles
        repeat(10000) begin
            @(posedge clk);
            cycle_count++;
            
            // Check if PC has stopped changing (after first cycle)
            if (cycle_count > 100 && dut.data.PC == dut.data.new_PC && prev_pc == dut.data.new_PC && prev_prev_pc == dut.data.new_PC) begin
                pc_stuck = 1;
                $display("PC stuck at: %0d \n", dut.data.PC);
                break;
            end
				
				prev_prev_pc = prev_pc;
				prev_pc = dut.data.PC;
        end
        
        if (!pc_stuck) begin
            $display("\nReached Max cycle count");
        end
        
        $stop;
    end
    
	 // cycle info
    always @(posedge clk) begin
        if (!reset) begin
            $display("CYCLE %0d | Time: %0t ns", cycle_count, $time);
            $display("PC:          %0d (0x%0h)", dut.data.PC, dut.data.PC);
            $display("Instruction: 0x%h (binary: %b)", dut.data.instruction, dut.data.instruction);
            $display("Opcode:      %b (11-bit: %b, 10-bit: %b, 8-bit: %b, 6-bit: %b)", 
                     dut.data.instruction[31:21],
                     dut.data.instruction[31:21],
                     dut.data.instruction[31:22],
                     dut.data.instruction[31:24],
                     dut.data.instruction[31:26]);
            
            // Decode instruction fields
            $display("\nInstruction Fields:");
            $display("  Rd:  X%0d", dut.data.Rd0);
            $display("  Rn:  X%0d", dut.data.Rn0);
            $display("  Rm:  X%0d", dut.data.Rm0);
            $display("  Imm12: %0d (0x%h)", dut.data.alu_12_0, dut.data.alu_12_0);
            $display("  Imm9:  %0d", dut.data.dt_address0);
            $display("  Shamt: %0d", dut.data.shamt0);
            
            // Control signals
            $display("\nControl Signals:");
            $display("  RegWrite:  %b", dut.RegWrite);
            $display("  MemWrite:  %b", dut.MemWrite);
            $display("  MemRead:   %b", dut.MemRead);
            $display("  MemtoReg:  %b", dut.MemtoReg);
            $display("  Reg2loc:   %b", dut.Reg2loc);
            $display("  UncondBr:  %b", dut.UncondBr);
            $display("  BrTaken:   %b", dut.BrTaken);
            $display("  setFlags:  %b", dut.control.setFlags);
            $display("  aluSrc:    %b", dut.aluSrc);
            $display("  alu_cntrl: %b", dut.alu_cntrl);
            
            // Data path signals
            $display("\nData Path:");
            $display("  DataA (Rn):        %0d (0x%h)", dut.data.DataA, dut.data.DataA);
            $display("  DataB (Rm):        %0d (0x%h)", dut.data.DataB, dut.data.DataB);
            $display("  ALU Input B:       %0d (0x%h)", dut.data.alu_in, dut.data.alu_in);
            $display("  ALU Result:        %0d (0x%h)", dut.data.alu_result, dut.data.alu_result);
            $display("  Memory Out:        %0d (0x%h)", dut.data.mem_out, dut.data.mem_out);
            $display("  WriteData (to Rd): %0d (0x%h)", dut.data.WriteData, dut.data.WriteData);
            
            // ALU Flags
            $display("\nALU Flags (Current/Registered):");
            $display("  Negative:  %b / %b", dut.data.negative, dut.negative_reg);
            $display("  Zero:      %b / %b", dut.data.zero, dut.zero_reg);
            $display("  Overflow:  %b / %b", dut.data.overflow, dut.overflow_reg);
            $display("  Carry:     %b / %b", dut.data.carry_out, dut.carry_out_reg);
            
            // PC calculation
            $display("\nPC Calculation:");
            $display("  Current PC:        %0d", dut.data.PC);
            $display("  PC + 4:            %0d", dut.data.standard_pc);
            $display("  Branch Target:     %0d", dut.data.pc_adder_out);
            $display("  Next PC:           %0d", dut.data.new_PC);
            
            // Instruction identification
            $display("\nInstruction Type:");
            case (dut.data.instruction[31:26])
                6'b000101: $display("B");
                default: begin
                    case (dut.data.instruction[31:24])
                        8'b10110100: $display("CBZ");
                        8'b01010100: $display("B.LT");
                        default: begin
                            case (dut.data.instruction[31:22])
                                10'b1001000100: $display("ADDI");
                                10'b1101001101: $display("LSR");
                                default: begin
                                    case (dut.data.instruction[31:21])
                                        11'b10101011000: $display("ADDS");
                                        11'b10001010000: $display("AND");
                                        11'b11001010000: $display("EOR");
                                        11'b11111000010: $display("LDUR");
                                        11'b11111000000: $display("STUR");
                                        11'b11101011000: $display("SUBS");
                                        default: $display("UNKNOWN INSTRUCTION");
                                    endcase
                                end
                            endcase
                        end
                    endcase
                end
            endcase
        end
    end
    
endmodule
