// a mux8to1 module that takes an 64 by 8 array in as an input and a 3 bit input sel
// has a 64 bit output out
module mux8to1 (in, sel, out);

    input logic [63:0] in [7:0]; 
    input logic [2:0] sel;
    output logic [63:0] out;
    logic [63:0] level1 [3:0];
    logic [63:0] level2 [1:0];

    genvar i;
    //8 → 4
    generate
        for (i = 0; i < 4; i++) begin : L1
            mux2to1_64bit m1 (in[2*i], in[2*i+1], sel[0], level1[i]);
        end
    endgenerate

    //4 → 2
    generate
        for (i = 0; i < 2; i++) begin : L2
            mux2to1_64bit m2 (level1[2*i], level1[2*i+1], sel[1], level2[i]);
        end
    endgenerate

    //2 → 1
    mux2to1_64bit m3 (level2[0], level2[1], sel[2], out);
endmodule
