/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module decimalOverflow(select, productOfl, quotientOfl, dp);

	input [1:0]select;
	input productOfl;
	input quotientOfl;
	output reg [1:0]dp;
	
	always @(*)
		begin
			case (select)
			2'b00: dp =2'b00; 					//add
			2'b01: dp =2'b00;						//subtract
			2'b10: dp ={productOfl, 1'b0};	//multiply
			2'b11: dp =quotientOfl;				//divide
			endcase
		end
endmodule
		
