/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/
//This code is based upon the adder in the book 'Fundamentals of Digital Logic with Verilog, 3rd Edition, by Brown and Vranesic.

module fullAdder (Cin, x, y, s, Cout);
	input Cin, x , y;
	output s, Cout;
	
	assign s = x ^ y ^ Cin;
	assign Cout = (x & y)|(x & Cin)|(y & Cin);
	
endmodule
	