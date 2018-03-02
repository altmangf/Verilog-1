module multiply(z, product, productOverflow);

	input  [7:0]z;
	output [7:0]product;
	output productOverflow;
	
	assign productOverflow = z[7];
	assign product[7:0] = z<<1;  //logical left by one to multiply z by 2
endmodule
