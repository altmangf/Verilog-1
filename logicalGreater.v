module logicalGreater(x, y, greaterBoolean);
	input [3:0]x;
	input [3:0]y;
	output reg greaterBoolean;
	
	always @(x,y)
		begin
			if (x == y) greaterBoolean=1;
			else greaterBoolean=0;
		end
endmodule
		