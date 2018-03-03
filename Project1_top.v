/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/


module Project1_top(SW, KEY, HEX0, HEX1, HEX4, HEX5, LED);//, MODE);
	input [9:0]SW;					//SW are the 10 switches on the DE10-lite
	input [1:0]KEY;				//KEY are the 2 keys on the DE10-lite
	output[7:0]HEX0;				//the first 7-segment display
	output[7:0]HEX1;				//the second 7-segment display
	output[7:0]HEX4;
	output[7:0]HEX5;
	output[9:0]LED;				//the 10 leds on the DE10-lite
	
	//output reg[1:0]MODE;			//register so we can map the KEY bits to MODE bits 
	
	wire [1:0]MODE;				//register so we can map the KEY bits to MODE bits (select between arithmetic.v, logical.v, comparison.v, magic.v) 
	wire [3:0]X;					//Wire assignments						
	wire [3:0]Y;
	wire [3:0]Ynot;				//wire for Ynot;
	wire [7:0]Z;	
	wire [9:0]LED;
	wire [1:0]OPERATION;			//bits to select the operation of each module. eg. in Arithmetic.v,  select between add, subtract, multiply, divide
	wire [7:0]arithmeticBinary; 
	wire [7:0]logicalBinary; 
	wire [7:0]comparisonBinary; 
	wire [7:0]hexDisplay;
	wire [9:0]LEDDisplay;
	wire [1:0]ofldecimalPoint;
	wire [1:0]decimalpointOut;
	wire arithmeticOverflow;
	wire LED9overflow;
	
	//this code splits the bits which come from the switches on the DE10-LITE so that they
	//can be processed in different modules.
	assign X = SW[3:0];			//sends bits 3-0 from switches to X
	assign Y = SW[7:4];			//sends bits 7-4 from switches to Y
	assign Z = SW[7:0];			//sends bits 7-0 from switches to Z
	assign OPERATION = SW[9:8];//sets the OPERATION bits. OPERATION selects the operation that each mode displays. eg. addition, subtraction, multiplication, division for the Arithmetic module.
	assign Ynot = ((~Y)+1'b1	//makes a 2's compliment of Y for the subtractor
	
	assign LED[7:0] = LEDDisplay[7:0];		//lights LED based on Sum from adder. for testing.
	assign LED[8] = LED9overflow;				//lights LED9 if there is overflow from adder/subtractor
	assign HEX0[7] = ~decimalpointOut[0];	//turns off decimal point on HEX0 for testing
	assign HEX1[7] = ~decimalpointOut[1];	//turns off decimal point on HEX1 for testing
	assign HEX4[7] = 1;							//turns off decimal point on HEX4
	
	//instantiate an instance of multiplexer. This decides which module will output to the 7-segment display. eg. Arithmetic, Logical, Comparison 
	multiplexer muxHexDisplayInst1$7(MODE[1:0], arithmeticBinary[7:0], logicalBinary[3:0], {4'b0, comparisonBinary[3:0]}, 8'b0, hexDisplay[7:0]);
	
	//instantiate an instance of multiplexer. This decides which module will output to the LED display. eg. Arithmetic, Logical, Comparison, magic 
	multiplexer muxLEDDisplayInst1$7(MODE[1:0], arithmeticBinary[7:0], logicalBinary[3:0], {4'b0, comparisonBinary[3:0]}, 8'b0, LEDDisplay[7:0]);
	
	//instantiate an instance of multiplexer. This decides which module will output to the decimal point. eg. Arithmetic, Logical, Comparison, 
	multiplexer muxdecimalPointInst1$1(MODE[1:0], ofldecimalPoint[1:0], 2'b0, 2'b0, 2'b0, decimalpointOut[1:0]);
	
	//instantiate an instance of multiplexer. This decides if LED9 can light if there is overflow from add or subtract
	multiplexer LED9Inst1$1(MODE[1:0], arithmeticOverflow, 2'b0, 2'b0, 2'b0, LED9overflow);
	
	//instantiate an instance of the keyReader module.  Reads the KEY select buttons and writes values to MODE register. MODE selects between aritmetic, logical, comparision and magic
	keyReader keyReaderInst1(KEY[1:0], MODE[1:0]);

	
	//instantiate an instance of the arithmetic module
	Arithmetic ArithmeticInst1(X[3:0], Y[3:0], Ynot[3:0], Z[7:0], OPERATION[1:0], arithmeticBinary[7:0], arithmeticOverflow, ofldecimalPoint[1:0]);
	
	
	//instantiate an instance of the comparison module
	comparison compareInst1(X[3:0], Y[3:0], OPERATION[1:0], comparisonBinary); 
	
	//instantiate an instance of the logical module
	logical logicalInst1(X[3:0], Y[3:0], Z[7:0], OPERATION[1:0], logicalBinary); 
	
	//instantiate an instance of the SevenSegment decoder to output the result of operations 
	SevenSegment displayResult(hexDisplay[7:0], HEX0, HEX1);       

	//instantiate an instance of the SevenSegment decoder to the currently selected MODE and OPERATION
	SevenSegment displayModeOp({2'b0,MODE[1:0],2'b0,OPERATION[1:0]}, HEX4, HEX5);       
	endmodule
