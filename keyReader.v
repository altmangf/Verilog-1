/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module keyReader (key, mode);

input [1:0]key;
output reg [1:0]mode;


always @(posedge key[0]) 
		begin
		mode[0] = ~mode[0];
		end
always @(posedge key[1])
		begin
		mode[1] = ~mode[1];
		end
		
endmodule



//CODE BELOW THIS LINE DOES NOT WORK
//_______________________________________
/*
always @(posedge key) 
		begin
		case (key[0])  	
			1'b1: mode[0] = ~mode[0];
		endcase	
		case (key[1])
			1'b1: mode[1] = ~mode[1];
		endcase
		end
		
endmodule
		

	always @(posedge key) 
		begin
		case (key[1:0])  	
			2'b00: mode=2'b00;
			2'b01: mode=2'b01;
			2'b10: mode=2'b10;
			2'b11: mode=2'b11;
		endcase
		end
		
endmodule	
*/