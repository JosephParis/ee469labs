// a mux that takes 3 1 bit inputs(a, b, and sel),  and has 1 1 bit out
// outputs a if sel is 0 and b if sel is 1
module mux2to1 (a, b, sel, out);
	 input logic a, b, sel;
    output logic out;
    logic not_sel, a_and_not_sel, b_and_sel;

    not u1 (not_sel, sel);
    and u2 (a_and_not_sel, a, not_sel);
    and u3 (b_and_sel, b, sel);
    or  u4 (out, a_and_not_sel, b_and_sel);
endmodule
