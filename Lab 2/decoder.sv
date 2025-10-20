// A decoder that takes a 1 bit RegWrite signal, a 5 bit WriteRegister, and outputs 
// a 32 bit out signal.
// Outputs a high signal in the bit that corresponds to value from the WriteRegister
// only if RegWrite is high. out is all 0s if RegWrite is 0.
module decoder (RegWrite, WriteRegister, out);

    input logic RegWrite;
	 input logic [4:0] WriteRegister;
	 output logic [31:0] out;
	 
	 logic [1:0] level1;
	 logic [3:0] level2;
	 logic [7:0] level3;
	 logic [15:0] level4;
	 genvar i;

    //1 → 2
    selector s1 (.in(RegWrite), .sel(WriteRegister[4]), .out1(level1[1]), .out2(level1[0]));
	 
	 //2 → 4
    generate
        for (i = 0; i < 2; i++) begin : L2
            selector s2 (.in(level1[i]), .sel(WriteRegister[3]), .out1(level2[(2*i)+1]), .out2(level2[2*i]));
        end
    endgenerate
	 
	 //4 → 8
    generate
        for (i = 0; i < 4; i++) begin : L3
            selector s3 (.in(level2[i]), .sel(WriteRegister[2]), .out1(level3[(2*i)+1]), .out2(level3[2*i]));
        end
    endgenerate
	 
	 //8 → 16
    generate
        for (i = 0; i < 8; i++) begin : L4
            selector s4 (.in(level3[i]), .sel(WriteRegister[1]), .out1(level4[(2*i)+1]), .out2(level4[2*i]));
        end
    endgenerate
	 
	 //16 → 32
    generate
        for (i = 0; i < 16; i++) begin : L5
            selector s5 (.in(level4[i]), .sel(WriteRegister[0]), .out1(out[(2*i)+1]), .out2(out[2*i]));
        end
    endgenerate
	 
endmodule
