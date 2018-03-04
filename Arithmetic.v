/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module Arithmetic(x, y, ynot, z, operation, returnValue, addSuboverflow, multdivOverflow);

	input [3:0]x;
	input [3:0]y;
	input [4:0]ynot;
	input [7:0]z;
	input	[1:0]operation;
	
	output[7:0]returnValue;
	output addSuboverflow;
	output [1:0]multdivOverflow;
	
	wire [7:0]sum;
	wire sumCarry;
	wire [7:0]difference;
	wire differenceCarry;
	wire [7:0]product;
	wire productOverflow;
	wire [7:0]quotient;
	wire remainder;
	wire [1:0]decimalPoint;
	
	assign multdivOverflow = decimalPoint[1:0];
	assign productOverflow = z[7];
	assign remainder = z[0];
	
	//instantiate add.v
	add addInst1(1'b0, x[3:0], y[3:0], sum[7:0], sumCarry); 
	
	//instantiate subtraction by using add.v with a 2's compliment
	add subtractInst1$5(1'b0, {1'b0,x[3:0]}, ynot[4:0], difference[7:0], differenceCarry); 
	
	//instantiate multiply.v
	multiply multiplyInst1(z[7:0], product[7:0]);//, productOverflow);  
	
	//instantiate divide.v
	divider divideInst1(z[7:0], quotient[7:0]);//, remainder);
	
	//instantiate an instance of the MUX. This selects the module which outputs to the 7 segment display.
	multiplexer muxAdderInst1$7(operation[1:0], sum[7:0], difference[7:0], product[7:0], quotient[7:0], returnValue[7:0]);
	
	//instantiate an instance of MUX. This returns the overflow bit from addition or subtraction to Project1_top
	multiplexer muxAddSuboverflowInst1$1(operation[1:0], {1'b0, sumCarry}, {1'b0, differenceCarry}, 2'b00, 2'b00, addSuboverflow);
	
	//instantiate an instance of MUX. This returns the overflow bit from multiplication or division to Project1_top
	//multiplexer muxMultDicoverflowInst1$1(operation[1:0], 2'b00, {1'b0, productOverflow}, 2'b00,{1'b0, remainder}); //,  dp[1:0]);
	
	//instantiate an instance of decimalOverflow. This returns the overflow bit from multiplication or division to Project1_top
	decimalOverflow decOvfl(operation[1:0], productOverflow, remainder, decimalPoint);
endmodule
	

	