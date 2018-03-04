/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module megaMaxMux(x, y, maxValueBoolean);
	input [3:0]x; 
	input [3:0]y;
	output reg [3:0]maxValueBoolean;
	
	
	wire [3:0]maxMux0;
	wire [3:0]maxMux1;
	wire [3:0]maxMux2;
	wire [3:0]maxMux3;
	wire [3:0]maxMux4;
	wire [3:0]maxMux5;
	wire [3:0]maxMux6;
	wire [3:0]maxMux7;
	wire [3:0]maxMux8;
	wire [3:0]maxMux9;
	wire [3:0]maxMux10;
	wire [3:0]maxMux11;
	wire [3:0]maxMux12;
	wire [3:0]maxMux13;
	wire [3:0]maxMux14;
	wire [3:0]maxMux15;
	
	assign maxMux0  = y[3]+y[2]+y[1]+y[0];
	assign maxMux1  = y[3]+y[2]+y[1];
	assign maxMux2  = y[3]+y[2]+((y[1]&y[0]));
	assign maxMux3  = y[3]+y[2];
	assign maxMux4  = y[3]+(y[2]&(y[1]+y[0]));
	assign maxMux5  = y[3]+(y[2]&y[1]);
	assign maxMux6  = y[3]+(y[2]&y[1]&y[0]);
	assign maxMux7  = y[3];
	assign maxMux8  = y[3]&(y[2]+y[1]+y[0]);
	assign maxMux9  = y[3]&(y[2]+y[1]);
	assign maxMux10 = y[3]&(y[2]+(y[1]&y[0]));
	assign maxMux11 = y[3]&y[2];
	assign maxMux12 =	y[3]&y[2]&(y[1]+y[0]);
	assign maxMux13 = y[3]&y[2]&y[1];
	assign maxMux14 = y[3]&y[2]&y[1]&y[0];
	assign maxMux15 = 0;
	
	
	always @(*)
	begin
		case(x)
			4'b0000: maxValueBoolean = maxMux0;
			4'b0001: maxValueBoolean = maxMux1;
			4'b0010: maxValueBoolean = maxMux2;
			4'b0011: maxValueBoolean = maxMux3;
			4'b0100: maxValueBoolean = maxMux4;
			4'b0101: maxValueBoolean = maxMux5;
			4'b0110: maxValueBoolean = maxMux6;
			4'b0111: maxValueBoolean = maxMux7;
			4'b1000: maxValueBoolean = maxMux8;
			4'b1001: maxValueBoolean = maxMux9;
			4'b1010: maxValueBoolean = maxMux10;
			4'b1011: maxValueBoolean = maxMux11;
			4'b1100: maxValueBoolean = maxMux12;
			4'b1101: maxValueBoolean = maxMux13;
			4'b1110: maxValueBoolean = maxMux14;
			4'b1111: maxValueBoolean = maxMux15;
		endcase
	end
		
	
endmodule
