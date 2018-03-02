module logicalLessthan(x, y, lessthanBoolean);
	input [3:0]x;
	input [3:0]y;
	output reg lessthanBoolean;
	
	always @(x,y)
		begin
			if (x == y) lessthanBoolean=1;
			else lessthanBoolean=0;
		end
endmodule
		