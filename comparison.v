/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module comparison (x, y, operation, returnMax); //returnBoolean, 

	input [3:0]x;
	input [3:0]y;
	input	[1:0]operation;
	//output returnBoolean;
	output [7:0]returnMax;
	
	wire equalBoolean;
	wire greaterBoolean;
	wire lessthanBoolean;
	wire [3:0] maxValue;


//instantiate instances of logical modules.	
logicalEqual	equalInst(x[3:0], y[3:0],equalBoolean);
logicalGreater	greaterInst(x[3:0], y[3:0], greaterBoolean);
logicalLessthan lessInst(x[3:0], y[3:0], lessthanBoolean);
max	maxInst(x[3:0], y[3:0], maxValue[3:0]);

//instantiate an instance of the MUX. This selects the module which outputs to the 7 segment display.
multiplexer muxComparisonInst1$7(operation[1:0], {7'b0, equalBoolean}, {7'b0, greaterBoolean}, {7'b0, lessthanBoolean}, {4'b0, maxValue[3:0]}, returnMax[7:0]);

endmodule
