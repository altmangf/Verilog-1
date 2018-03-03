/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module logicalNot (z, returnNot);
	input [7:0]z;
	//input [1:0]operation;
	
	output reg[7:0]returnNot;
	
	//wire [3:0]notResult;
	
	always @(*)
		begin
		returnNot = ~z;
		end
		
endmodule
	