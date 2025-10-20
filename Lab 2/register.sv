// a 64 bit register that takes a 64 bit iput d, 3 1 bit signals in wr_en, reset, and clk
// and 1 64 bit output q
// Keeps outputting the value q, and updates q to be equal to d only if wr_en is high
module register (d, q, wr_en, reset, clk);
	input logic [63:0] d;
	output logic [63:0] q;
	input logic wr_en, reset, clk;
	
	logic [63:0] d_mid;
	
	mux2to1_64bit m (.a(q), .b(d), .sel(wr_en), .out(d_mid));
	
	genvar i;
	generate
	 for(i=0; i<64; i++) begin : eachDff
		D_FF ff (.q(q[i]),  .d(d_mid[i]), .reset, .clk);
	 end
	endgenerate

	
endmodule