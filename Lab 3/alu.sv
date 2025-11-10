// an alu that takes 2 64 bit inputs(A and B), and 1 3 bit input called cntrl
// Has 1 64 bit output called result and 4 1 bit flag outputs called 
// negative, zero, overflow, and carry_out
// Based off of cntrl, the ALU performs a different operation on A and B that 
// is reflected in result and the flags
// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant
module alu (A, B, cntrl, result, negative, zero, overflow, carry_out);
	input logic [63:0] A, B;
	input logic [2:0] cntrl;
  
	output logic [63:0] result;
	output logic negative, zero, overflow, carry_out;
	
	logic [63:0] result_arr [7:0]; // array of potential results, instruction corresponds to result, 1 holds B_sub
	logic [1:0] overflow_vals [2:0];
	logic sub, not_sum, not_a, not_b;
	genvar i;
	
	and a1 (sub, cntrl[1], cntrl[0]); //value of sub
	// 010:			result = A + B
	// 011:			result = A - B
	// xor B with sub to get B_sub for subtraction
	generate
	  for (i = 0; i < 64; i++) begin : xors
			xor x1 (result_arr[1][i], B[i], sub);
	  end
	endgenerate
	adder_64bit add1 (.a(A), .b(result_arr[1]), .ci(sub), .co(carry_out), .sum(result_arr[2])); // gives carry_out and result_adder
	assign result_arr[3] = result_arr[2];
	assign result_arr[0] = B;
	
	//100:			result = bitwise A & B
	generate
	  for (i = 0; i < 64; i++) begin : ands
			and a2 (result_arr[4][i], A[i], B[i]);
	  end
	endgenerate
	
	// 101:			result = bitwise A | B
	generate
	  for (i = 0; i < 64; i++) begin : ors
			or o1 (result_arr[5][i], A[i], B[i]);
	  end
	endgenerate
	
	// 110:			result = bitwise A XOR B
	generate
	  for (i = 0; i < 64; i++) begin : xors2
			xor x2 (result_arr[6][i], A[i], B[i]);
	  end
	endgenerate


	mux8to1 m1(.in(result_arr), .sel(cntrl), .out(result)); // outputs result
	
	//overflow calculations
	not n1 (not_sum, result_arr[2][63]);
	not n2 (not_a, A[63]);
	not n3 (not_b, B[63]);
	
	
	and a3 (overflow_vals[0][0], A[63], B[63], not_sum); // a and b are positive, sum is negative
	and a4 (overflow_vals[0][1], not_a, not_b, result_arr[2][63]); // a and b are negative, sum is positive
	
	and a5 (overflow_vals[1][0], A[63], not_b, not_sum); //a is positive, b is negative, and sum is negative
	and a6 (overflow_vals[1][1], not_a, B[63], result_arr[2][63]); // a is negative, b is positive, and sum is positive
	
	or o2 (overflow_vals[2][0], overflow_vals[0][0], overflow_vals[0][1]); // overflow for add
	or o3 (overflow_vals[2][1], overflow_vals[1][0], overflow_vals[1][1]); // overflow for sub

	and neg (negative, result[63], 1'b1); //negative
	giant_nor gnor (.in(result), .out(zero)); //zero
	mux2to1 m2 (.a(overflow_vals[2][0]), .b(overflow_vals[2][1]), .sel(cntrl[0]), .out(overflow)); //overflow
endmodule