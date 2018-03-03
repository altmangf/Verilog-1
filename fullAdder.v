/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module fullAdder (Cin, x, y, s, Cout);
	input Cin, x , y;
	output s, Cout;
	
	assign s = x ^ y ^ Cin;
	assign Cout = (x & y)|(x & Cin)|(y & Cin);
	
endmodule
	