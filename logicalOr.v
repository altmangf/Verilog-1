/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module logicalOr (x, y, operation, returnOr);
	input [3:0]x;
	input [3:0]y;
	input [1:0]operation;
	
	output reg[3:0]returnOr;
	
	wire [3:0]orResult;
	
	always @(*)
		begin
		returnOr = x|y;
		end
		
endmodule
	