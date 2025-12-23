onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group dut /cpu_tb/dut/BrTaken
add wave -noupdate -group dut /cpu_tb/dut/MemRead
add wave -noupdate -group dut /cpu_tb/dut/MemWrite
add wave -noupdate -group dut /cpu_tb/dut/MemtoReg
add wave -noupdate -group dut /cpu_tb/dut/Reg2loc
add wave -noupdate -group dut /cpu_tb/dut/RegWrite
add wave -noupdate -group dut /cpu_tb/dut/UncondBr
add wave -noupdate -group dut /cpu_tb/dut/aluSrc
add wave -noupdate -group dut /cpu_tb/dut/alu_cntrl
add wave -noupdate -group dut /cpu_tb/dut/carry_out_reg
add wave -noupdate -group dut /cpu_tb/dut/clk
add wave -noupdate -group dut /cpu_tb/dut/instr_type
add wave -noupdate -group dut /cpu_tb/dut/negative_reg
add wave -noupdate -group dut /cpu_tb/dut/overflow_reg
add wave -noupdate -group dut /cpu_tb/dut/reset
add wave -noupdate -group dut /cpu_tb/dut/setFlags
add wave -noupdate -group dut /cpu_tb/dut/zero
add wave -noupdate -group dut /cpu_tb/dut/zero_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_12_0
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_12_1
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_cntrl
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_cntrl_reg1
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_in
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_result
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_result_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/alu_src_in
add wave -noupdate -group data /cpu_tb/dut/data/aluSrc
add wave -noupdate -group data /cpu_tb/dut/data/aluSrc_reg1
add wave -noupdate -group data /cpu_tb/dut/data/ble_actually_taken
add wave -noupdate -group data /cpu_tb/dut/data/ble_condition
add wave -noupdate -group data /cpu_tb/dut/data/ble_taken
add wave -noupdate -group data /cpu_tb/dut/data/br_actually_taken
add wave -noupdate -group data /cpu_tb/dut/data/br_address
add wave -noupdate -group data /cpu_tb/dut/data/BrTaken
add wave -noupdate -group data /cpu_tb/dut/data/carry_out
add wave -noupdate -group data /cpu_tb/dut/data/carry_out_reg
add wave -noupdate -group data /cpu_tb/dut/data/cb_instr
add wave -noupdate -group data /cpu_tb/dut/data/cbz_actually_taken
add wave -noupdate -group data /cpu_tb/dut/data/cbz_condition
add wave -noupdate -group data /cpu_tb/dut/data/cbz_forwarding_sel
add wave -noupdate -group data /cpu_tb/dut/data/cbz_forwarding_sel_equals
add wave -noupdate -group data /cpu_tb/dut/data/cbz_forwarding_values
add wave -noupdate -group data /cpu_tb/dut/data/cbz_taken
add wave -noupdate -group data /cpu_tb/dut/data/check_Rm
add wave -noupdate -group data /cpu_tb/dut/data/clk
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/cond_br_address
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataA
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataA_exe_fwd
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataA_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataB
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataB_cbz
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataB_exe_fwd
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataB_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/DataB_reg1
add wave -noupdate -group data /cpu_tb/dut/data/disconnect1
add wave -noupdate -group data /cpu_tb/dut/data/disconnect2
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/dt_address0
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/dt_address1
add wave -noupdate -group data /cpu_tb/dut/data/instr_type
add wave -noupdate -group data /cpu_tb/dut/data/instr_type_reg1
add wave -noupdate -group data /cpu_tb/dut/data/instr_type_reg2
add wave -noupdate -group data /cpu_tb/dut/data/instr_type_reg3
add wave -noupdate -group data /cpu_tb/dut/data/instruction
add wave -noupdate -group data /cpu_tb/dut/data/instruction1
add wave -noupdate -group data /cpu_tb/dut/data/mem_forwarding_sel
add wave -noupdate -group data /cpu_tb/dut/data/mem_forwarding_sel_equals
add wave -noupdate -group data /cpu_tb/dut/data/mem_forwarding_values
add wave -noupdate -group data /cpu_tb/dut/data/mem_out
add wave -noupdate -group data /cpu_tb/dut/data/memData_fwd
add wave -noupdate -group data /cpu_tb/dut/data/MemRead
add wave -noupdate -group data /cpu_tb/dut/data/MemRead_reg1
add wave -noupdate -group data /cpu_tb/dut/data/MemRead_reg2
add wave -noupdate -group data /cpu_tb/dut/data/MemtoReg
add wave -noupdate -group data /cpu_tb/dut/data/MemtoReg_reg1
add wave -noupdate -group data /cpu_tb/dut/data/MemtoReg_reg2
add wave -noupdate -group data /cpu_tb/dut/data/MemWrite
add wave -noupdate -group data /cpu_tb/dut/data/MemWrite_reg1
add wave -noupdate -group data /cpu_tb/dut/data/MemWrite_reg2
add wave -noupdate -group data /cpu_tb/dut/data/negative
add wave -noupdate -group data /cpu_tb/dut/data/negative_fwd
add wave -noupdate -group data /cpu_tb/dut/data/negative_reg
add wave -noupdate -group data /cpu_tb/dut/data/new_PC
add wave -noupdate -group data /cpu_tb/dut/data/overflow
add wave -noupdate -group data /cpu_tb/dut/data/overflow_fwd
add wave -noupdate -group data /cpu_tb/dut/data/overflow_reg
add wave -noupdate -group data /cpu_tb/dut/data/PC
add wave -noupdate -group data /cpu_tb/dut/data/pc_adder_out
add wave -noupdate -group data /cpu_tb/dut/data/PC_reg
add wave -noupdate -group data /cpu_tb/dut/data/Rd0
add wave -noupdate -group data /cpu_tb/dut/data/Rd1
add wave -noupdate -group data /cpu_tb/dut/data/Rd2
add wave -noupdate -group data /cpu_tb/dut/data/Rd2_is_x31
add wave -noupdate -group data /cpu_tb/dut/data/Rd2_not_x31
add wave -noupdate -group data /cpu_tb/dut/data/Rd3
add wave -noupdate -group data /cpu_tb/dut/data/Rd3_is_x31
add wave -noupdate -group data /cpu_tb/dut/data/Rd3_not_x31
add wave -noupdate -group data /cpu_tb/dut/data/Rd_forwarding_sel_and
add wave -noupdate -group data /cpu_tb/dut/data/Rd_forwarding_sel_equals
add wave -noupdate -group data /cpu_tb/dut/data/ReadRegister2
add wave -noupdate -group data /cpu_tb/dut/data/Reg2loc
add wave -noupdate -group data /cpu_tb/dut/data/Reg2Loc_reg1
add wave -noupdate -group data /cpu_tb/dut/data/RegWrite
add wave -noupdate -group data /cpu_tb/dut/data/RegWrite_reg1
add wave -noupdate -group data /cpu_tb/dut/data/RegWrite_reg2
add wave -noupdate -group data /cpu_tb/dut/data/RegWrite_reg3
add wave -noupdate -group data /cpu_tb/dut/data/reset
add wave -noupdate -group data /cpu_tb/dut/data/Rm0
add wave -noupdate -group data /cpu_tb/dut/data/Rm1
add wave -noupdate -group data /cpu_tb/dut/data/Rm_forwarding_sel_and
add wave -noupdate -group data /cpu_tb/dut/data/Rm_forwarding_sel_equals
add wave -noupdate -group data /cpu_tb/dut/data/Rm_Rd_forwarding_sel
add wave -noupdate -group data /cpu_tb/dut/data/Rm_Rd_forwarding_values
add wave -noupdate -group data /cpu_tb/dut/data/Rn0
add wave -noupdate -group data /cpu_tb/dut/data/Rn1
add wave -noupdate -group data /cpu_tb/dut/data/Rn_forwarding_sel
add wave -noupdate -group data /cpu_tb/dut/data/Rn_forwarding_sel_equals
add wave -noupdate -group data /cpu_tb/dut/data/Rn_forwarding_values
add wave -noupdate -group data /cpu_tb/dut/data/selected_br_address
add wave -noupdate -group data /cpu_tb/dut/data/setFlags
add wave -noupdate -group data /cpu_tb/dut/data/setFlags_reg1
add wave -noupdate -group data /cpu_tb/dut/data/shamt0
add wave -noupdate -group data /cpu_tb/dut/data/shamt1
add wave -noupdate -group data /cpu_tb/dut/data/shifter_out
add wave -noupdate -group data /cpu_tb/dut/data/standard_pc
add wave -noupdate -group data /cpu_tb/dut/data/UncondBr
add wave -noupdate -group data /cpu_tb/dut/data/WriteData
add wave -noupdate -group data /cpu_tb/dut/data/WriteData_reg
add wave -noupdate -group data /cpu_tb/dut/data/zero
add wave -noupdate -group data /cpu_tb/dut/data/zero_reg
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/a
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/and_chain
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/b
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/equal
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/mid
add wave -noupdate -expand -group cbz_forwarding_sel_equals1 /cpu_tb/dut/data/cbz_forwarding_sel_equals1/N
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/a
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/and_chain
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/b
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/equal
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/mid
add wave -noupdate -expand -group cbz_forwarding_sel_equals2 /cpu_tb/dut/data/cbz_forwarding_sel_equals2/N
add wave -noupdate -expand -group cbz_forwarding_mux -radix decimal /cpu_tb/dut/data/cbz_forwarding_mux/in
add wave -noupdate -expand -group cbz_forwarding_mux -radix decimal /cpu_tb/dut/data/cbz_forwarding_mux/level1
add wave -noupdate -expand -group cbz_forwarding_mux -radix decimal /cpu_tb/dut/data/cbz_forwarding_mux/out
add wave -noupdate -expand -group cbz_forwarding_mux /cpu_tb/dut/data/cbz_forwarding_mux/sel
add wave -noupdate -group cntrl /cpu_tb/dut/control/BrTaken
add wave -noupdate -group cntrl /cpu_tb/dut/control/MemRead
add wave -noupdate -group cntrl /cpu_tb/dut/control/MemWrite
add wave -noupdate -group cntrl /cpu_tb/dut/control/MemtoReg
add wave -noupdate -group cntrl /cpu_tb/dut/control/Reg2loc
add wave -noupdate -group cntrl /cpu_tb/dut/control/RegWrite
add wave -noupdate -group cntrl /cpu_tb/dut/control/UncondBr
add wave -noupdate -group cntrl /cpu_tb/dut/control/aluSrc
add wave -noupdate -group cntrl /cpu_tb/dut/control/alu_cntrl
add wave -noupdate -group cntrl /cpu_tb/dut/control/carry_out_reg
add wave -noupdate -group cntrl /cpu_tb/dut/control/clk
add wave -noupdate -group cntrl /cpu_tb/dut/control/instr_type
add wave -noupdate -group cntrl /cpu_tb/dut/control/instruction
add wave -noupdate -group cntrl /cpu_tb/dut/control/negative_reg
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_10bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_11bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_6bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_8bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/overflow_reg
add wave -noupdate -group cntrl /cpu_tb/dut/control/setFlags
add wave -noupdate -group cntrl /cpu_tb/dut/control/zero
add wave -noupdate -group cntrl /cpu_tb/dut/control/zero_reg
add wave -noupdate -group datamem -radix decimal /cpu_tb/dut/data/datamemory/mem
add wave -noupdate -group datamem -radix decimal /cpu_tb/dut/data/datamemory/address
add wave -noupdate -group datamem -radix decimal /cpu_tb/dut/data/datamemory/aligned_address
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/clk
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/i
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/j
add wave -noupdate -group datamem -radix decimal /cpu_tb/dut/data/datamemory/read_data
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/read_enable
add wave -noupdate -group datamem -radix decimal /cpu_tb/dut/data/datamemory/write_data
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/write_enable
add wave -noupdate -group datamem /cpu_tb/dut/data/datamemory/xfer_size
add wave -noupdate -group instructmem -radix decimal /cpu_tb/dut/data/instructionmemory/address
add wave -noupdate -group instructmem /cpu_tb/dut/data/instructionmemory/clk
add wave -noupdate -group instructmem /cpu_tb/dut/data/instructionmemory/i
add wave -noupdate -group instructmem /cpu_tb/dut/data/instructionmemory/instruction
add wave -noupdate -group instructmem /cpu_tb/dut/data/instructionmemory/mem
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/DecodeOut
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/ReadData1
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/ReadData2
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/ReadRegister1
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/ReadRegister2
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/RegOut
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/RegWrite
add wave -noupdate -expand -group regfile -radix decimal /cpu_tb/dut/data/registers/WriteData
add wave -noupdate -expand -group regfile -radix unsigned /cpu_tb/dut/data/registers/WriteRegister
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/clk
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/a
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/b
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/carry
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/ci
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/co
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/sum
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/a
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/b
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/carry
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/ci
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/co
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/sum
add wave -noupdate -group aluSrc -radix decimal /cpu_tb/dut/data/alu_src/in
add wave -noupdate -group aluSrc -radix decimal /cpu_tb/dut/data/alu_src/level1
add wave -noupdate -group aluSrc -radix decimal /cpu_tb/dut/data/alu_src/out
add wave -noupdate -group aluSrc /cpu_tb/dut/data/alu_src/sel
add wave -noupdate -group alumod -radix decimal /cpu_tb/dut/data/alumod/A
add wave -noupdate -group alumod -radix decimal /cpu_tb/dut/data/alumod/B
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/carry_out
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/cntrl
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/negative
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_a
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_b
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_sum
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/overflow
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/overflow_vals
add wave -noupdate -group alumod -radix decimal /cpu_tb/dut/data/alumod/result
add wave -noupdate -group alumod -radix decimal /cpu_tb/dut/data/alumod/result_arr
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/sub
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/zero
add wave -noupdate -group Rm/Rd_forward_mux /cpu_tb/dut/data/Rm_Rd_forwarding_mux/in
add wave -noupdate -group Rm/Rd_forward_mux /cpu_tb/dut/data/Rm_Rd_forwarding_mux/level1
add wave -noupdate -group Rm/Rd_forward_mux /cpu_tb/dut/data/Rm_Rd_forwarding_mux/out
add wave -noupdate -group Rm/Rd_forward_mux /cpu_tb/dut/data/Rm_Rd_forwarding_mux/sel
add wave -noupdate -group Rn_forward_mux /cpu_tb/dut/data/Rn_forwarding_mux/in
add wave -noupdate -group Rn_forward_mux /cpu_tb/dut/data/Rn_forwarding_mux/level1
add wave -noupdate -group Rn_forward_mux /cpu_tb/dut/data/Rn_forwarding_mux/out
add wave -noupdate -group Rn_forward_mux /cpu_tb/dut/data/Rn_forwarding_mux/sel
add wave -noupdate -group mem_forward_mux /cpu_tb/dut/data/mem_forwarding_mux/a
add wave -noupdate -group mem_forward_mux /cpu_tb/dut/data/mem_forwarding_mux/b
add wave -noupdate -group mem_forward_mux /cpu_tb/dut/data/mem_forwarding_mux/sel
add wave -noupdate -group mem_forward_mux /cpu_tb/dut/data/mem_forwarding_mux/out
add wave -noupdate -expand -group br_taken -radix decimal /cpu_tb/dut/data/brtaken/a
add wave -noupdate -expand -group br_taken -radix decimal /cpu_tb/dut/data/brtaken/b
add wave -noupdate -expand -group br_taken -radix decimal /cpu_tb/dut/data/brtaken/out
add wave -noupdate -expand -group br_taken /cpu_tb/dut/data/brtaken/sel
add wave -noupdate -expand -group pc_reg /cpu_tb/dut/data/pc_reg/clk
add wave -noupdate -expand -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/d
add wave -noupdate -expand -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/d_mid
add wave -noupdate -expand -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/q
add wave -noupdate -expand -group pc_reg /cpu_tb/dut/data/pc_reg/reset
add wave -noupdate -expand -group pc_reg /cpu_tb/dut/data/pc_reg/wr_en
add wave -noupdate -group uncondBR -radix decimal /cpu_tb/dut/data/uncondbr/a
add wave -noupdate -group uncondBR -radix decimal /cpu_tb/dut/data/uncondbr/b
add wave -noupdate -group uncondBR -radix decimal /cpu_tb/dut/data/uncondbr/out
add wave -noupdate -group uncondBR /cpu_tb/dut/data/uncondbr/sel
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/a
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/b
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/out
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {518616 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 191
configure wave -valuecolwidth 40
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {436368 ps} {657059 ps}
