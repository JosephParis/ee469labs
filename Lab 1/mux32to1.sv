// a mux that takes an array of 32 64 bit inputs called in, a 5 bit sel signal,
// and a 64 bit out signal
// Outputs the sel-th 64 bit element in the input array.
// (i.e. 0 inputs the first element, 31 the last)
module mux32to1 (in, sel, out);

    input logic [63:0] in [31:0];
    input logic [4:0]   sel;
    output logic [63:0] out;
    logic [63:0] level1 [15:0];
    logic [63:0] level2 [7:0];
    logic [63:0] level3 [3:0];
    logic [63:0] level4 [1:0];

    genvar i;

    //32 → 16
    generate
        for (i = 0; i < 16; i++) begin : L1
            mux2to1_64bit m1 (in[2*i], in[2*i+1], sel[0], level1[i]);
        end
    endgenerate

    //16 → 8
    generate
        for (i = 0; i < 8; i++) begin : L2
            mux2to1_64bit m2 (level1[2*i], level1[2*i+1], sel[1], level2[i]);
        end
    endgenerate

    //8 → 4
    generate
        for (i = 0; i < 4; i++) begin : L3
            mux2to1_64bit m3 (level2[2*i], level2[2*i+1], sel[2], level3[i]);
        end
    endgenerate

    //4 → 2
    generate
        for (i = 0; i < 2; i++) begin : L4
            mux2to1_64bit m4 (level3[2*i], level3[2*i+1], sel[3], level4[i]);
        end
    endgenerate

    //2 → 1
    mux2to1_64bit m5 (level4[0], level4[1], sel[4], out);
endmodule
