module logicalEqual(x, y, equalBoolean);
	input [3:0]x;
	input [3:0]y;
	output reg equalBoolean;
	
	always @(x,y)
		begin
			if (x == y) equalBoolean=1;
			else equalBoolean=0;
		end
endmodule
		