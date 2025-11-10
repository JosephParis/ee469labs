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
add wave -noupdate -group dut /cpu_tb/dut/instruction
add wave -noupdate -group dut /cpu_tb/dut/negative_reg
add wave -noupdate -group dut /cpu_tb/dut/overflow_reg
add wave -noupdate -group dut /cpu_tb/dut/reset
add wave -noupdate -group dut /cpu_tb/dut/setFlags
add wave -noupdate -group dut /cpu_tb/dut/zero_reg
add wave -noupdate -group data /cpu_tb/dut/data/BrTaken
add wave -noupdate -group data /cpu_tb/dut/data/DataA
add wave -noupdate -group data /cpu_tb/dut/data/DataB
add wave -noupdate -group data /cpu_tb/dut/data/MemRead
add wave -noupdate -group data /cpu_tb/dut/data/MemWrite
add wave -noupdate -group data /cpu_tb/dut/data/MemtoReg
add wave -noupdate -group data /cpu_tb/dut/data/PC
add wave -noupdate -group data /cpu_tb/dut/data/Rd
add wave -noupdate -group data /cpu_tb/dut/data/ReadRegister2
add wave -noupdate -group data /cpu_tb/dut/data/Reg2loc
add wave -noupdate -group data /cpu_tb/dut/data/RegWrite
add wave -noupdate -group data /cpu_tb/dut/data/Rm
add wave -noupdate -group data /cpu_tb/dut/data/Rn
add wave -noupdate -group data /cpu_tb/dut/data/UncondBr
add wave -noupdate -group data /cpu_tb/dut/data/WriteData
add wave -noupdate -group data /cpu_tb/dut/data/aluSrc
add wave -noupdate -group data /cpu_tb/dut/data/alu_12
add wave -noupdate -group data /cpu_tb/dut/data/alu_cntrl
add wave -noupdate -group data /cpu_tb/dut/data/alu_in
add wave -noupdate -group data -radix binary /cpu_tb/dut/data/alu_result
add wave -noupdate -group data /cpu_tb/dut/data/alu_src_in
add wave -noupdate -group data /cpu_tb/dut/data/br_address
add wave -noupdate -group data /cpu_tb/dut/data/carry_out
add wave -noupdate -group data /cpu_tb/dut/data/carry_out_reg
add wave -noupdate -group data /cpu_tb/dut/data/clk
add wave -noupdate -group data /cpu_tb/dut/data/cond_br_address
add wave -noupdate -group data /cpu_tb/dut/data/disconnect1
add wave -noupdate -group data /cpu_tb/dut/data/disconnect2
add wave -noupdate -group data /cpu_tb/dut/data/dt_address
add wave -noupdate -group data /cpu_tb/dut/data/instruction
add wave -noupdate -group data /cpu_tb/dut/data/mem_out
add wave -noupdate -group data /cpu_tb/dut/data/negative
add wave -noupdate -group data /cpu_tb/dut/data/negative_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/new_PC
add wave -noupdate -group data /cpu_tb/dut/data/op
add wave -noupdate -group data /cpu_tb/dut/data/overflow
add wave -noupdate -group data /cpu_tb/dut/data/overflow_reg
add wave -noupdate -group data -radix decimal /cpu_tb/dut/data/pc_adder_out
add wave -noupdate -group data /cpu_tb/dut/data/reset
add wave -noupdate -group data /cpu_tb/dut/data/selected_br_address
add wave -noupdate -group data /cpu_tb/dut/data/setFlags
add wave -noupdate -group data /cpu_tb/dut/data/shamt
add wave -noupdate -group data /cpu_tb/dut/data/shifter_out
add wave -noupdate -group data /cpu_tb/dut/data/standard_pc
add wave -noupdate -group data /cpu_tb/dut/data/zero
add wave -noupdate -group data /cpu_tb/dut/data/zero_reg
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
add wave -noupdate -group cntrl /cpu_tb/dut/control/instruction
add wave -noupdate -group cntrl /cpu_tb/dut/control/negative_reg
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_10bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_11bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_6bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/opcode_8bit
add wave -noupdate -group cntrl /cpu_tb/dut/control/overflow_reg
add wave -noupdate -group cntrl /cpu_tb/dut/control/setFlags
add wave -noupdate -group cntrl /cpu_tb/dut/control/zero_reg
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/DecodeOut
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/ReadData1
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/ReadData2
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/ReadRegister1
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/ReadRegister2
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/RegOut
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/RegWrite
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/WriteData
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/WriteRegister
add wave -noupdate -expand -group regfile /cpu_tb/dut/data/registers/clk
add wave -noupdate -expand -group alu_src /cpu_tb/dut/data/alu_src/in
add wave -noupdate -expand -group alu_src /cpu_tb/dut/data/alu_src/level1
add wave -noupdate -expand -group alu_src /cpu_tb/dut/data/alu_src/out
add wave -noupdate -expand -group alu_src /cpu_tb/dut/data/alu_src/sel
add wave -noupdate -group LSR_shifter /cpu_tb/dut/data/LSR_shifter/direction
add wave -noupdate -group LSR_shifter /cpu_tb/dut/data/LSR_shifter/distance
add wave -noupdate -group LSR_shifter /cpu_tb/dut/data/LSR_shifter/result
add wave -noupdate -group LSR_shifter /cpu_tb/dut/data/LSR_shifter/value
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/a
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/b
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/out
add wave -noupdate -group reg2loc /cpu_tb/dut/data/reg2loc/sel
add wave -noupdate -group uncondbr -radix decimal /cpu_tb/dut/data/uncondbr/a
add wave -noupdate -group uncondbr -radix decimal /cpu_tb/dut/data/uncondbr/b
add wave -noupdate -group uncondbr -radix decimal /cpu_tb/dut/data/uncondbr/out
add wave -noupdate -group uncondbr /cpu_tb/dut/data/uncondbr/sel
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/a
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/b
add wave -noupdate -group pc_adder /cpu_tb/dut/data/pc_adder/carry
add wave -noupdate -group pc_adder /cpu_tb/dut/data/pc_adder/ci
add wave -noupdate -group pc_adder /cpu_tb/dut/data/pc_adder/co
add wave -noupdate -group pc_adder -radix decimal /cpu_tb/dut/data/pc_adder/sum
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/a
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/b
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/carry
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/ci
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/co
add wave -noupdate -group standardPC -radix decimal /cpu_tb/dut/data/standardPC/sum
add wave -noupdate -group brtaken -radix decimal /cpu_tb/dut/data/brtaken/a
add wave -noupdate -group brtaken -radix decimal /cpu_tb/dut/data/brtaken/b
add wave -noupdate -group brtaken -radix decimal /cpu_tb/dut/data/brtaken/out
add wave -noupdate -group brtaken /cpu_tb/dut/data/brtaken/sel
add wave -noupdate -group instructionmemory /cpu_tb/dut/data/instructionmemory/address
add wave -noupdate -group instructionmemory /cpu_tb/dut/data/instructionmemory/clk
add wave -noupdate -group instructionmemory /cpu_tb/dut/data/instructionmemory/i
add wave -noupdate -group instructionmemory /cpu_tb/dut/data/instructionmemory/instruction
add wave -noupdate -group instructionmemory /cpu_tb/dut/data/instructionmemory/mem
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/A
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/B
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/carry_out
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/cntrl
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/negative
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_a
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_b
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/not_sum
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/overflow
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/overflow_vals
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/result
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/result_arr
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/sub
add wave -noupdate -group alumod /cpu_tb/dut/data/alumod/zero
add wave -noupdate -group datamemory -radix decimal /cpu_tb/dut/data/datamemory/address
add wave -noupdate -group datamemory -radix decimal /cpu_tb/dut/data/datamemory/aligned_address
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/clk
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/i
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/j
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/mem
add wave -noupdate -group datamemory -radix decimal /cpu_tb/dut/data/datamemory/read_data
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/read_enable
add wave -noupdate -group datamemory -radix decimal /cpu_tb/dut/data/datamemory/write_data
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/write_enable
add wave -noupdate -group datamemory /cpu_tb/dut/data/datamemory/xfer_size
add wave -noupdate -group memtoreg /cpu_tb/dut/data/memtoreg/a
add wave -noupdate -group memtoreg /cpu_tb/dut/data/memtoreg/b
add wave -noupdate -group memtoreg /cpu_tb/dut/data/memtoreg/out
add wave -noupdate -group memtoreg /cpu_tb/dut/data/memtoreg/sel
add wave -noupdate -group pc_reg /cpu_tb/dut/data/pc_reg/clk
add wave -noupdate -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/d
add wave -noupdate -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/d_mid
add wave -noupdate -group pc_reg -radix decimal /cpu_tb/dut/data/pc_reg/q
add wave -noupdate -group pc_reg /cpu_tb/dut/data/pc_reg/reset
add wave -noupdate -group pc_reg /cpu_tb/dut/data/pc_reg/wr_en
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/clk
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/d
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/d_mid
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/q
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/reset
add wave -noupdate -group zer_bit /cpu_tb/dut/data/zer_bit/wr_en
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/clk
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/d
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/d_mid
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/q
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/reset
add wave -noupdate -group neg_bit /cpu_tb/dut/data/neg_bit/wr_en
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/clk
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/d
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/d_mid
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/q
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/reset
add wave -noupdate -group ove_bit /cpu_tb/dut/data/ove_bit/wr_en
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/clk
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/d
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/d_mid
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/q
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/reset
add wave -noupdate -group car_bit /cpu_tb/dut/data/car_bit/wr_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156229426 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {241434 ps} {402392 ps}
