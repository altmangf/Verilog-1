

module Project1_top(SW, KEY, HEX0, HEX1, LED);
	input [9:0]SW;
	input [1:0]KEY;
	output[7:0]HEX0;
	output[7:0]HEX1;
	output[9:0]LED;
	
	
	wire [3:0]X;
	wire [3:0]Y;
	wire [7:0]Z;
	wire [7:0]S;
	wire Cout;
	
	assign HEX0[7] = 1'b0001;
	assign HEX1[7] = 1'b0001;
	
	assign X = SW[3:0];
	assign Y = SW[7:4];
	assign Z = SW[7:0];
	
	add Inst1(1'b0, X[3:0], Y[3:0], S, Cout); //LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	//SevenSegment Inst_1(S, HEX0, HEX1);		  //LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	//SevenSegment Inst_1(SW, HEX0, HEX1);		  //DO NOT LEAVE THIS COMMENTED OUT TO TEST 7 SEGMENT DISPLAY
	SevenSegment Inst_1(S, HEX0, HEX1);       //USE THIS INSTANTIATION FOR TESTING THE ADDER (DOES NOT WORK YET)
endmodule
