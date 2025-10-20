onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regstim/ClockDelay
add wave -noupdate -radix hexadecimal /regstim/ReadData1
add wave -noupdate -radix hexadecimal /regstim/ReadData2
add wave -noupdate -radix binary /regstim/ReadRegister1
add wave -noupdate -radix binary /regstim/ReadRegister2
add wave -noupdate -radix hexadecimal /regstim/RegWrite
add wave -noupdate -radix hexadecimal /regstim/WriteData
add wave -noupdate -radix hexadecimal /regstim/WriteRegister
add wave -noupdate -radix hexadecimal /regstim/clk
add wave -noupdate -radix hexadecimal /regstim/i
add wave -noupdate -group dut /regstim/dut/ReadData1
add wave -noupdate -group dut /regstim/dut/ReadData2
add wave -noupdate -group dut /regstim/dut/ReadRegister1
add wave -noupdate -group dut /regstim/dut/ReadRegister2
add wave -noupdate -group dut /regstim/dut/WriteRegister
add wave -noupdate -group dut /regstim/dut/RegWrite
add wave -noupdate -group dut /regstim/dut/clk
add wave -noupdate -group dut /regstim/dut/WriteData
add wave -noupdate -group dut /regstim/dut/DecodeOut
add wave -noupdate -group dut /regstim/dut/RegOut
add wave -noupdate -group decoder /regstim/dut/d1/RegWrite
add wave -noupdate -group decoder /regstim/dut/d1/WriteRegister
add wave -noupdate -group decoder /regstim/dut/d1/out
add wave -noupdate -group decoder /regstim/dut/d1/level1
add wave -noupdate -group decoder /regstim/dut/d1/level2
add wave -noupdate -group decoder /regstim/dut/d1/level3
add wave -noupdate -group decoder /regstim/dut/d1/level4
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/in
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/level1
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/level2
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/level3
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/level4
add wave -noupdate -expand -group m1 -radix hexadecimal /regstim/dut/m1/out
add wave -noupdate -expand -group m1 /regstim/dut/m1/sel
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/in
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/level1
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/level2
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/level3
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/level4
add wave -noupdate -expand -group m2 -radix hexadecimal /regstim/dut/m2/out
add wave -noupdate -expand -group m2 /regstim/dut/m2/sel
add wave -noupdate -expand -group {reg31 - always 0} /regstim/dut/reg31/clk
add wave -noupdate -expand -group {reg31 - always 0} -radix hexadecimal /regstim/dut/reg31/d
add wave -noupdate -expand -group {reg31 - always 0} -radix hexadecimal /regstim/dut/reg31/d_mid
add wave -noupdate -expand -group {reg31 - always 0} -radix hexadecimal /regstim/dut/reg31/q
add wave -noupdate -expand -group {reg31 - always 0} /regstim/dut/reg31/reset
add wave -noupdate -expand -group {reg31 - always 0} /regstim/dut/reg31/wr_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7747143 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 395
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
WaveRestoreZoom {0 ps} {23102155 ps}
