onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab5_testbench/USERID
add wave -noupdate /lab5_testbench/ADDRESS_WIDTH
add wave -noupdate /lab5_testbench/DATA_WIDTH
add wave -noupdate /lab5_testbench/CLOCK_PERIOD
add wave -noupdate -radix decimal /lab5_testbench/address
add wave -noupdate -radix hexadecimal /lab5_testbench/data_in
add wave -noupdate /lab5_testbench/bytemask
add wave -noupdate /lab5_testbench/write
add wave -noupdate /lab5_testbench/start_access
add wave -noupdate /lab5_testbench/access_done
add wave -noupdate -radix decimal -childformat {{{/lab5_testbench/data_out[63]} -radix decimal} {{/lab5_testbench/data_out[62]} -radix decimal} {{/lab5_testbench/data_out[61]} -radix decimal} {{/lab5_testbench/data_out[60]} -radix decimal} {{/lab5_testbench/data_out[59]} -radix decimal} {{/lab5_testbench/data_out[58]} -radix decimal} {{/lab5_testbench/data_out[57]} -radix decimal} {{/lab5_testbench/data_out[56]} -radix decimal} {{/lab5_testbench/data_out[55]} -radix decimal} {{/lab5_testbench/data_out[54]} -radix decimal} {{/lab5_testbench/data_out[53]} -radix decimal} {{/lab5_testbench/data_out[52]} -radix decimal} {{/lab5_testbench/data_out[51]} -radix decimal} {{/lab5_testbench/data_out[50]} -radix decimal} {{/lab5_testbench/data_out[49]} -radix decimal} {{/lab5_testbench/data_out[48]} -radix decimal} {{/lab5_testbench/data_out[47]} -radix decimal} {{/lab5_testbench/data_out[46]} -radix decimal} {{/lab5_testbench/data_out[45]} -radix decimal} {{/lab5_testbench/data_out[44]} -radix decimal} {{/lab5_testbench/data_out[43]} -radix decimal} {{/lab5_testbench/data_out[42]} -radix decimal} {{/lab5_testbench/data_out[41]} -radix decimal} {{/lab5_testbench/data_out[40]} -radix decimal} {{/lab5_testbench/data_out[39]} -radix decimal} {{/lab5_testbench/data_out[38]} -radix decimal} {{/lab5_testbench/data_out[37]} -radix decimal} {{/lab5_testbench/data_out[36]} -radix decimal} {{/lab5_testbench/data_out[35]} -radix decimal} {{/lab5_testbench/data_out[34]} -radix decimal} {{/lab5_testbench/data_out[33]} -radix decimal} {{/lab5_testbench/data_out[32]} -radix decimal} {{/lab5_testbench/data_out[31]} -radix decimal} {{/lab5_testbench/data_out[30]} -radix decimal} {{/lab5_testbench/data_out[29]} -radix decimal} {{/lab5_testbench/data_out[28]} -radix decimal} {{/lab5_testbench/data_out[27]} -radix decimal} {{/lab5_testbench/data_out[26]} -radix decimal} {{/lab5_testbench/data_out[25]} -radix decimal} {{/lab5_testbench/data_out[24]} -radix decimal} {{/lab5_testbench/data_out[23]} -radix decimal} {{/lab5_testbench/data_out[22]} -radix decimal} {{/lab5_testbench/data_out[21]} -radix decimal} {{/lab5_testbench/data_out[20]} -radix decimal} {{/lab5_testbench/data_out[19]} -radix decimal} {{/lab5_testbench/data_out[18]} -radix decimal} {{/lab5_testbench/data_out[17]} -radix decimal} {{/lab5_testbench/data_out[16]} -radix decimal} {{/lab5_testbench/data_out[15]} -radix decimal} {{/lab5_testbench/data_out[14]} -radix decimal} {{/lab5_testbench/data_out[13]} -radix decimal} {{/lab5_testbench/data_out[12]} -radix decimal} {{/lab5_testbench/data_out[11]} -radix decimal} {{/lab5_testbench/data_out[10]} -radix decimal} {{/lab5_testbench/data_out[9]} -radix decimal} {{/lab5_testbench/data_out[8]} -radix decimal} {{/lab5_testbench/data_out[7]} -radix decimal} {{/lab5_testbench/data_out[6]} -radix decimal} {{/lab5_testbench/data_out[5]} -radix decimal} {{/lab5_testbench/data_out[4]} -radix decimal} {{/lab5_testbench/data_out[3]} -radix decimal} {{/lab5_testbench/data_out[2]} -radix decimal} {{/lab5_testbench/data_out[1]} -radix decimal} {{/lab5_testbench/data_out[0]} -radix decimal}} -subitemconfig {{/lab5_testbench/data_out[63]} {-height 15 -radix decimal} {/lab5_testbench/data_out[62]} {-height 15 -radix decimal} {/lab5_testbench/data_out[61]} {-height 15 -radix decimal} {/lab5_testbench/data_out[60]} {-height 15 -radix decimal} {/lab5_testbench/data_out[59]} {-height 15 -radix decimal} {/lab5_testbench/data_out[58]} {-height 15 -radix decimal} {/lab5_testbench/data_out[57]} {-height 15 -radix decimal} {/lab5_testbench/data_out[56]} {-height 15 -radix decimal} {/lab5_testbench/data_out[55]} {-height 15 -radix decimal} {/lab5_testbench/data_out[54]} {-height 15 -radix decimal} {/lab5_testbench/data_out[53]} {-height 15 -radix decimal} {/lab5_testbench/data_out[52]} {-height 15 -radix decimal} {/lab5_testbench/data_out[51]} {-height 15 -radix decimal} {/lab5_testbench/data_out[50]} {-height 15 -radix decimal} {/lab5_testbench/data_out[49]} {-height 15 -radix decimal} {/lab5_testbench/data_out[48]} {-height 15 -radix decimal} {/lab5_testbench/data_out[47]} {-height 15 -radix decimal} {/lab5_testbench/data_out[46]} {-height 15 -radix decimal} {/lab5_testbench/data_out[45]} {-height 15 -radix decimal} {/lab5_testbench/data_out[44]} {-height 15 -radix decimal} {/lab5_testbench/data_out[43]} {-height 15 -radix decimal} {/lab5_testbench/data_out[42]} {-height 15 -radix decimal} {/lab5_testbench/data_out[41]} {-height 15 -radix decimal} {/lab5_testbench/data_out[40]} {-height 15 -radix decimal} {/lab5_testbench/data_out[39]} {-height 15 -radix decimal} {/lab5_testbench/data_out[38]} {-height 15 -radix decimal} {/lab5_testbench/data_out[37]} {-height 15 -radix decimal} {/lab5_testbench/data_out[36]} {-height 15 -radix decimal} {/lab5_testbench/data_out[35]} {-height 15 -radix decimal} {/lab5_testbench/data_out[34]} {-height 15 -radix decimal} {/lab5_testbench/data_out[33]} {-height 15 -radix decimal} {/lab5_testbench/data_out[32]} {-height 15 -radix decimal} {/lab5_testbench/data_out[31]} {-height 15 -radix decimal} {/lab5_testbench/data_out[30]} {-height 15 -radix decimal} {/lab5_testbench/data_out[29]} {-height 15 -radix decimal} {/lab5_testbench/data_out[28]} {-height 15 -radix decimal} {/lab5_testbench/data_out[27]} {-height 15 -radix decimal} {/lab5_testbench/data_out[26]} {-height 15 -radix decimal} {/lab5_testbench/data_out[25]} {-height 15 -radix decimal} {/lab5_testbench/data_out[24]} {-height 15 -radix decimal} {/lab5_testbench/data_out[23]} {-height 15 -radix decimal} {/lab5_testbench/data_out[22]} {-height 15 -radix decimal} {/lab5_testbench/data_out[21]} {-height 15 -radix decimal} {/lab5_testbench/data_out[20]} {-height 15 -radix decimal} {/lab5_testbench/data_out[19]} {-height 15 -radix decimal} {/lab5_testbench/data_out[18]} {-height 15 -radix decimal} {/lab5_testbench/data_out[17]} {-height 15 -radix decimal} {/lab5_testbench/data_out[16]} {-height 15 -radix decimal} {/lab5_testbench/data_out[15]} {-height 15 -radix decimal} {/lab5_testbench/data_out[14]} {-height 15 -radix decimal} {/lab5_testbench/data_out[13]} {-height 15 -radix decimal} {/lab5_testbench/data_out[12]} {-height 15 -radix decimal} {/lab5_testbench/data_out[11]} {-height 15 -radix decimal} {/lab5_testbench/data_out[10]} {-height 15 -radix decimal} {/lab5_testbench/data_out[9]} {-height 15 -radix decimal} {/lab5_testbench/data_out[8]} {-height 15 -radix decimal} {/lab5_testbench/data_out[7]} {-height 15 -radix decimal} {/lab5_testbench/data_out[6]} {-height 15 -radix decimal} {/lab5_testbench/data_out[5]} {-height 15 -radix decimal} {/lab5_testbench/data_out[4]} {-height 15 -radix decimal} {/lab5_testbench/data_out[3]} {-height 15 -radix decimal} {/lab5_testbench/data_out[2]} {-height 15 -radix decimal} {/lab5_testbench/data_out[1]} {-height 15 -radix decimal} {/lab5_testbench/data_out[0]} {-height 15 -radix decimal}} /lab5_testbench/data_out
add wave -noupdate /lab5_testbench/clk
add wave -noupdate /lab5_testbench/reset
add wave -noupdate /lab5_testbench/cycles
add wave -noupdate /lab5_testbench/delay
add wave -noupdate -radix hexadecimal /lab5_testbench/dummy_data
add wave -noupdate /lab5_testbench/i
add wave -noupdate /lab5_testbench/maxval
add wave -noupdate /lab5_testbench/minval
add wave -noupdate /lab5_testbench/j
add wave -noupdate /lab5_testbench/counter_16
add wave -noupdate /lab5_testbench/counter_44
add wave -noupdate /lab5_testbench/counter_108
add wave -noupdate /lab5_testbench/big_counter_16
add wave -noupdate /lab5_testbench/big_counter_108
add wave -noupdate -radix hexadecimal /lab5_testbench/write_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {21049487 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 130
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 5000
configure wave -gridperiod 10000
configure wave -griddelta 4
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {7512896 ps} {25767051 ps}
