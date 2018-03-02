

module Project1_top(SW, KEY, HEX0, HEX1, LED);//, MODE);
	input [9:0]SW;					//SW are the 10 switches on the DE10-lite
	input [1:0]KEY;				//KEY are the 2 keys on the DE10-lite
	output[7:0]HEX0;				//the first 7-segment display
	output[7:0]HEX1;				//the second 7-segment display
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
	wire [3:0]logicalBinary; 
	wire [3:0]comparisonBinary; 
	wire [7:0]hexDisplay;
	wire arithmeticOverflow;	
	
	//this code splits the bits which come from the switches on the DE10-LITE so that they
	//can be processed in different modules.
	assign X = SW[3:0];			//sends bits 3-0 from switches to X
	assign Y = SW[7:4];			//sends bits 7-4 from switches to Y
	assign Z = SW[7:0];			//sends bits 7-0 from switches to Z
	assign OPERATION = SW[9:8];
	assign Ynot = ((~Y)+1'b1);
	
	assign LED[7:0] = arithmeticBinary[7:0];	//lights LED based on Sum from adder. for testing.
	assign LED[8] = arithmeticOverflow;			//lights LED9 if there is overflow from adder/subtractor
	assign HEX0[7] = 1'b0001;	//turns off decimal point on HEX0 for testing
	assign HEX1[7] = 1'b0001;	//turns off decimal point on HEX1 for testing
	
	//instantiate an instance of multiplexer. This decides which of the module are output to the 7-segment display. eg. Arithmetic, Logical, Comparison, 
	multiplexer muxHexDisplayInst1$7(MODE[1:0], arithmeticBinary[7:0], {4'b1111, logicalBinary[3:0]}, {4'b0000,comparisonBinary[3:0]}, 8'b11111111, hexDisplay[7:0]);
	
	//instantiate an instance of the keyReader module.  Reads the KEY select buttons and writes values to MODE register
	keyReader keyReaderInst1(KEY, MODE);

	
	//instantiate an instance of the arithmetic module
	Arithmetic ArithmeticInst1(X[3:0], Y[3:0], Ynot[3:0], Z[7:0], OPERATION[1:0], arithmeticBinary[7:0], arithmeticOverflow);
	
	
	
	//instantiate an instance of the SevenSegment decoder
	SevenSegment Inst_1(hexDisplay[7:0], HEX0, HEX1);       
endmodule
