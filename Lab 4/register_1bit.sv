module register_1bit (d, q, wr_en, reset, clk);
	input logic d;
	output logic q;
	input logic wr_en, reset, clk;
	
	logic d_mid;
	
	mux2to1 m (.a(q), .b(d), .sel(wr_en), .out(d_mid));
	
	D_FF ff (.q(q),  .d(d_mid), .reset, .clk);
endmodule

module register_nbit #(parameter n = 1) (d, q, wr_en, reset, clk);
	input logic [n-1:0] d;
	output logic [n-1:0] q;
	input logic wr_en, reset, clk;
	
	logic [n-1:0] d_mid;
	
	genvar i;
	generate
		for(i=0; i<n; i++) begin : eachDff
			mux2to1 m (.a(q[i]), .b(d[i]), .sel(wr_en), .out(d_mid[i]));
			D_FF ff (.q(q[i]), .d(d_mid[i]), .reset, .clk);
		end
	endgenerate
endmodule