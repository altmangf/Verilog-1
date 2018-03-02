module divide(z, quotient, remainder);

	input  [7:0]z;
	output [7:0]quotient;
	output remainder;
	
	assign remainder = z[0];
	assign quotient[7:0] = z>>1;  //logical shift right by one to divide z by 2
endmodule
