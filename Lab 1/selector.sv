// Selector moudle that takes 1 bit inputs in and sel
// and has 1 bit outputs out1 and out2.
//  out1 == in & sel
// out2 == in & ~sel
module selector (in, sel, out1, out2);

    input logic in, sel;
	 output logic out1, out2;
	 
	 logic not_sel;
	 
	 and a1 (out1, in, sel); // out1 == in & sel
	 not n1 (not_sel, sel);
	 and a2 (out2, in, not_sel); // out2 == in & ~sel
	 
endmodule