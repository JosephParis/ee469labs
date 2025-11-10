
module register_1bit (d, q, wr_en, reset, clk);
	input logic d;
	output logic q;
	input logic wr_en, reset, clk;
	
	logic d_mid;
	
	mux2to1 m (.a(q), .b(d), .sel(wr_en), .out(d_mid));
	
	D_FF ff (.q(q),  .d(d_mid), .reset, .clk);
endmodule