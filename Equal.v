/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module Equal(x, y, equalBoolean);
	input [3:0]x;
	input [3:0]y;
	output reg equalBoolean;
	
	always @(x,y)
		begin
			if (x == y) equalBoolean=1;
			else equalBoolean=0;
		end
endmodule
		