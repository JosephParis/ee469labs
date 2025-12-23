module equals #(parameter N = 5) (a, b, equal);
	input logic [N-1:0] a, b;
	output logic equal;
	
	logic [N-1:0] mid;
	logic [N-2:0] and_chain; // perform N-2 ands
	
	genvar i;
	// equal if every xnor results in a 1
	generate
	 for(i=0; i < N; i++) begin : eachAnd
		xnor a1 (mid[i], a[i], b[i]);
	 end
	endgenerate
	
	generate
		and a2 (and_chain[0], mid[0], mid[1]);
		for(i=1; i < N-1; i++) begin : andLevel
			and a3 (and_chain[i], and_chain[i-1], mid[i+1]);
		end
	endgenerate

assign equal = and_chain[N-2]; // last and is 1 only if all values in mid are 1

endmodule