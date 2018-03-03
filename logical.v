/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module logical(x, y, z, operation, returnLogical); 

	input [3:0]x;
	input [3:0]y;
	input [7:0]z;
	input	[1:0]operation;
	output [7:0]returnLogical;
	
	wire [3:0]andValue;
	wire [3:0]orValue;
	wire [3:0]exorValue;
	wire [7:0]notValue;


//instantiate instances of logical modules.	
logicalAnd	andInst	(x[3:0], y[3:0], andValue[3:0]);
logicalOr	orInst	(x[3:0], y[3:0], orValue[3:0]);
logicalExor exorInst	(x[3:0], y[3:0], exorValue[3:0]);
logicalNot	notInst	(z[7:0], notValue[7:0]);

//instantiate an instance of the MUX. This selects the module which outputs to the 7 segment display.
multiplexer muxLogicalInst1$7(operation[1:0], {4'b0, andValue}, {4'b0, orValue}, {4'b0, exorValue}, notValue[7:0], returnLogical[7:0]);

endmodule