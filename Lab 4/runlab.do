# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./D_FF.sv"
vlog "./register.sv"
vlog "./mux2to1.sv"
vlog "./mux2to1_64bit.sv"
vlog "./mux32to1.sv"
vlog "./regstim.sv"
vlog "./regfile.sv"
vlog "./decoder.sv"
vlog "./selector.sv"
vlog "./alustim.sv"
vlog "./alu.sv"
vlog "./adder_64bit.sv"
vlog "./full_adder.sv"
vlog "./giant_nor.sv"
vlog "./mux8to1.sv"
vlog "./mux4to1.sv"
vlog "./mux2to1_5bit.sv"
vlog "./register_1bit.sv"
vlog "./math.sv"
vlog "./instructmem.sv"
vlog "./datamem.sv"
vlog "./cpu_top.sv"
vlog "./cpu_tb.sv"
vlog "./cpu_data.sv"
vlog "./cpu_cntrl.sv"
vlog "./equals.sv"





# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work cpu_tb

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpu_tb4.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
