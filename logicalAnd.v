/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module logicalAnd (x, y, returnAnd);
	input [3:0]x;
	input [3:0]y;
	//input [1:0]operation;
	
	output reg[3:0]returnAnd;
	
	//wire [3:0]andResult;
	
	always @(*)
		begin
		returnAnd = x&y;
		end
		
endmodule
	