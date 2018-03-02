module multiplexer (SELECT, A, B, C, D, OUT);	//nbits,
 parameter  q = 7;
 //input [1:0]nbits;
 input [1:0]SELECT; 	// 2-bit control signal (MODE) and input A, B, C, D; 
 input [q:0]A;
 input [q:0]B;
 input [q:0]C;
 input [q:0]D;

 output reg [7:0]OUT;				// The output of the MUX 
 
 always @(SELECT) 
	begin
		if (SELECT == 2'b00) 
			OUT = A;
		else if (SELECT == 2'b01)
			OUT = B;
		else if (SELECT == 2'b10)
			OUT = C;
		else if (SELECT == 2'b11) 
			OUT = D; 
		end
 endmodule 