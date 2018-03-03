/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module max(x, y, maxValue);
	input [3:0]x; 
	input [3:0]y;
	output reg [3:0] maxValue;
	
	//WE CANNOT USE THIS CODE! WE MUST DERIVE EQUATIONS
	
	always @(x, y)
	begin
		if (x-y<0)
			maxValue = y;
		else if	(y-x<0)
			maxValue = x;
		else if (y-x==0)
			maxValue = 0;
		else
			maxValue = 0;
	end
		
	
endmodule
