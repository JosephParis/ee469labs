// a mux4to1 module that takes an 64 by 4 array in as an input and a 2 bit input sel
// has a 64 bit output out
module mux4to1 (in, sel, out);

    input logic [63:0] in [3:0]; 
    input logic [1:0] sel;
    output logic [63:0] out;
    logic [63:0] level1 [1:0];

    genvar i;
    //4 → 2
    generate
        for (i = 0; i < 2; i++) begin : L1
            mux2to1_64bit m1 (in[2*i], in[2*i+1], sel[0], level1[i]);
        end
    endgenerate

    //2 → 1
    mux2to1_64bit m2 (level1[0], level1[1], sel[1], out);
endmodule
