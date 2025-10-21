// A mux with 2 64 bit inputs(a and b), a 1 bit sel, and a 64 bit output
// Outputs a if sel is 0 and b if sel is 1
module mux2to1_64bit (a, b, sel, out);

    input logic [63:0] a, b;
    input logic sel;
    output [63:0] out;
	 
    genvar i;
    generate
        for (i = 0; i < 64; i++) begin : bit64mux
            mux2to1 m (.a(a[i]), .b(b[i]), .sel(sel), .out(out[i]));
        end
    endgenerate
endmodule
