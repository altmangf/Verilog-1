/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module maxTT(x, y, maxValue);
	input [3:0]x; 
	input [3:0]y;
	
	output reg [3:0]maxValue;
	
	wire[3:0]maxValueBoolean;
	
	megaMaxMux bigMux(x, y, maxValueBoolean);
	
	
	always @(*) 
	begin
		if (maxValueBoolean == 1)
			maxValue = y;
		else if (maxValueBoolean ==0)
			maxValue = x;
	end

	
endmodule
