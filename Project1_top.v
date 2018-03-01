

module Project1_top(SW, KEY, HEX0, HEX1, LED);
	input [9:0]SW;					//SW are the 10 switches on the DE10-lite
	input [1:0]KEY;				//KEY are the 2 keys on the DE10-lite
	output[7:0]HEX0;				//the first 7-segment display
	output[7:0]HEX1;				//the second 7-segment display
	output[9:0]LED;				//the 10 leds on the DE10-lite
	
	
	wire [3:0]X;					//Wire assignments						
	wire [3:0]Y;
	wire [7:0]Z;
	wire [7:0]S;
	wire [9:0]LED;
	wire Cout;
	
	assign HEX0[7] = 1'b0001;	//turns off decimal point on HEX0 for testing
	assign HEX1[7] = 1'b0001;	//turns off decimal point on HEX1 for testing
	
	
	//this code splits the bits which come from the switches on the DE10-LITE so that they
	//can be processed in different modules.
	assign X = SW[3:0];			//sends bits 3-0 from switches to X
	assign Y = SW[7:4];			//sends bits 7-4 from switches to Y
	assign Z = SW[7:0];			//sends bits 7-0 from switches to Z
	
	assign LED[7:0] = S[7:0];	//lights LED based on Sum from adder. for testing.
	
	//instantiate an instance of the add, the ripple-carry adder
	add Inst1(1'b0, X[3:0], Y[3:0], S, Cout); //LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	
	//instantiate an instance of the SevenSegment decoder
	//SevenSegment Inst_1(S, HEX0, HEX1);		//LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	//SevenSegment Inst_1(SW, HEX0, HEX1);		//DO NOT LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	SevenSegment Inst_1(S, HEX0, HEX1);       //USE THIS INSTANTIATION FOR TESTING THE ADDER (DOES NOT WORK YET)
endmodule
