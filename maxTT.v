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
		case (maxValueBoolean)
		4'b0: maxValue = x;
		2'b1: maxValue = y;
		default maxValue = y;
		endcase
	
	
	/*
		if (maxValueBoolean[3:0] == 4'b1)
			maxValue = y[3:0];
		else if (maxValueBoolean[3:0] == 4'b0)
			maxValue = x[3:0];
	*/
	end

	
endmodule
