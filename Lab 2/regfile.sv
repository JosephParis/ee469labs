// A regfile that contains 32 64 bit registers and ways to read/ write to them
// Takes 3 5 bit inputs ReadRegister1, ReadRegister2, and WriteRegister
// 2 1 bit signals RegWrite and clk, and a 64 input WriteData
// Outputs 2 64 bit signals ReadData1 and ReadData2
// ReadRegister1 and ReadRegister2 determine which registers to read from and output
// in ReadData1 and ReadData2 respectively
// WriteRegister determines the register to write WriteData to if RegWrite is high
module regfile (ReadData1, ReadData2, WriteData, 
					 ReadRegister1, ReadRegister2, WriteRegister,
					 RegWrite, clk);
	output logic [63:0] ReadData1, ReadData2;
	input logic [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input logic RegWrite, clk;
	input logic [63:0] WriteData;
  
  
	logic [31:0] DecodeOut;
	logic [63:0] RegOut [31:0];
  
	decoder d1 (.RegWrite, .WriteRegister, .out(DecodeOut));
  
  
	genvar i;
	generate
	  for (i = 0; i < 31; i++) begin : registers
			register reg1 (.d(WriteData), .q(RegOut[i]), .wr_en(DecodeOut[i]), .reset(1'b0), .clk);
	  end
	endgenerate
	
	register reg31 (.d(64'b0), .q(RegOut[31]), .wr_en(1'b1), .reset(1'b0), .clk);
	
	mux32to1 m1 (.in(RegOut), .sel(ReadRegister1), .out(ReadData1));
	mux32to1 m2 (.in(RegOut), .sel(ReadRegister2), .out(ReadData2));

	
endmodule