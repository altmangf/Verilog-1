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
			maxValue[3:0] = y[3:0];
		else if	(y-x<0)
			maxValue[3:0] = x[3:0];
		else if (y-x==0)
			maxValue[3:0] = 4'b00;
		else
			maxValue = 4'b00;
	end
		
	
endmodule
