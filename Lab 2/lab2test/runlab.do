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


# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work alustim

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do alu.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
