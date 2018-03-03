/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

/*module keyReader2(key, mode)

input [1:0]key;
output reg [1:0]mode;
	
	always @(posedge KEY[1:0]) 
		begin
		if (key[0] == 1)
			mode[0] = ~mode[0];
		else if (key[1] == 1)
			mode[1] = ~mode[1];
		end
endmodule
*/		