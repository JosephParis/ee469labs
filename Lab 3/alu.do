onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group alustim -radix decimal /alustim/A
add wave -noupdate -expand -group alustim /alustim/ALU_ADD
add wave -noupdate -expand -group alustim /alustim/ALU_AND
add wave -noupdate -expand -group alustim /alustim/ALU_OR
add wave -noupdate -expand -group alustim /alustim/ALU_PASS_B
add wave -noupdate -expand -group alustim /alustim/ALU_SUBTRACT
add wave -noupdate -expand -group alustim /alustim/ALU_XOR
add wave -noupdate -expand -group alustim -radix decimal /alustim/B
add wave -noupdate -expand -group alustim /alustim/carry_out
add wave -noupdate -expand -group alustim /alustim/cntrl
add wave -noupdate -expand -group alustim /alustim/delay
add wave -noupdate -expand -group alustim /alustim/i
add wave -noupdate -expand -group alustim /alustim/negative
add wave -noupdate -expand -group alustim /alustim/overflow
add wave -noupdate -expand -group alustim -radix decimal /alustim/result
add wave -noupdate -expand -group alustim /alustim/test_val
add wave -noupdate -expand -group alustim /alustim/zero
add wave -noupdate -group dut /alustim/dut/A
add wave -noupdate -group dut /alustim/dut/B
add wave -noupdate -group dut /alustim/dut/carry_out
add wave -noupdate -group dut /alustim/dut/cntrl
add wave -noupdate -group dut /alustim/dut/negative
add wave -noupdate -group dut /alustim/dut/not_a
add wave -noupdate -group dut /alustim/dut/not_b
add wave -noupdate -group dut /alustim/dut/not_sum
add wave -noupdate -group dut /alustim/dut/overflow
add wave -noupdate -group dut /alustim/dut/overflow_vals
add wave -noupdate -group dut /alustim/dut/result
add wave -noupdate -group dut /alustim/dut/result_arr
add wave -noupdate -group dut /alustim/dut/sub
add wave -noupdate -group dut /alustim/dut/zero
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/a
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/b
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/carry
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/ci
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/co
add wave -noupdate -expand -group adder_64bit /alustim/dut/add1/sum
add wave -noupdate -expand -group giant_nor /alustim/dut/gnor/in
add wave -noupdate -expand -group giant_nor /alustim/dut/gnor/middle1
add wave -noupdate -expand -group giant_nor /alustim/dut/gnor/middle2
add wave -noupdate -expand -group giant_nor /alustim/dut/gnor/out
add wave -noupdate -expand -group mux8to1 /alustim/dut/m1/in
add wave -noupdate -expand -group mux8to1 /alustim/dut/m1/level1
add wave -noupdate -expand -group mux8to1 /alustim/dut/m1/level2
add wave -noupdate -expand -group mux8to1 /alustim/dut/m1/out
add wave -noupdate -expand -group mux8to1 /alustim/dut/m1/sel
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/a
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/b
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/sel
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/out
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/not_sel
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/a_and_not_sel
add wave -noupdate -expand -group mux2to1 /alustim/dut/m2/b_and_sel
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10299666808 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {10253389830 ps} {10406527768 ps}
