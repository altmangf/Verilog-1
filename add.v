/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

//This code is based upon the adder in the book 'Fundamentals of Digital Logic with Verilog, 3rd Edition, by Brown and Vranesic.

module add#(parameter n=8)(carryin, Xin, Yin, S, carryout);
	
	input 	carryin;
	input 	[n-1:0]Xin;
	input		[n-1:0]Yin;
	output 	[7:0]S;
	output carryout;
	wire [n:0]C;
	
	genvar i;
	assign C[0]=carryin;
	assign carryout = C[n-1];	
	
	generate
		for(i = 0;i <= n-1;i=i+1)
		begin:
			addbit fullAdder stage(C[i], Xin[i],Yin[i], S[i], C[i+1]);
		end
	endgenerate
		
endmodule
