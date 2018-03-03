/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module maxTT(x, y, maxValue);
	input [3:0]x; 
	input [3:0]y;
	output reg [3:0]maxValue;
	
	//WE CANNOT USE THIS CODE! WE MUST DERIVE EQUATIONS
	
	
	always @(*)
	begin
		if (x<y) begin
			maxValue[3:0] = y[3:0];
		end else if	(y<x) begin
			maxValue[3:0] = x[3:0];
		end else if (y==x) begin
			maxValue[3:0] = 4'b00;
		end else begin
			maxValue = 4'b00;
		
		end
	end
		
	
endmodule
