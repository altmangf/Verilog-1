/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module logicalExor (x, y, returnExor);
	input [3:0]x;
	input [3:0]y;
	//input [1:0]operation;
	
	output reg[3:0]returnExor;
	
	//wire [3:0]exorResult;
	
	always @(*)
		begin
		returnExor = x^y;
		end
		
endmodule
	