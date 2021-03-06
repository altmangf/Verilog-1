/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module Lessthan(x, y, lessthanBoolean);
	input [3:0]x;
	input [3:0]y;
	output reg lessthanBoolean;
	
	always @(x,y)
		begin
			if (x < y) lessthanBoolean=1;
			else lessthanBoolean=0;
		end
endmodule
		