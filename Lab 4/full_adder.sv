// a full_adder module that takes 3 1 bit inputs a, b, and ci
// has 2 1 bit outputs co and sum
module full_adder (a, b, ci, co, sum);
	input logic a, b, ci;
	output logic co, sum;
	
	logic t1, t2, t3;
	
	xor x1 (sum, a, b, ci);
	
	nand n1(t1, a, ci);
	nand n2(t2, a, b);
	nand n3(t3, b, ci);
	
	nand n4(co, t1, t2, t3);
	
	
endmodule
