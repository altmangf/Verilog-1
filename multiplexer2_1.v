/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module multiplexer2_1 (SELECT, A, B, OUT);	
 
 input [1:0]SELECT; 	// 1-bit control signal (MODE) 
 input A;
 input B;

 output reg OUT;				// The output of the MUX 
 
 always @(SELECT) 
	begin
		if (SELECT == 2'b00) 
			OUT = A;
		else if (SELECT == 2'b01)
			OUT = B;
	end
 endmodule 