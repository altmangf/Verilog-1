/*
Gabriel Altman
ECEN 2350 Digital Logic
March, 2018
*/

module add(carryin, Xin, Yin, S, carryout);
	parameter n=4;
	input 	carryin;
	input 	[n-1:0]Xin;
	input		[n-1:0]Yin;
	output 	[n-1:0]S;
	output carryout;
	wire [n+1:0]C;//[n:0]C;
	
	genvar i;
	assign C[0]=carryin;
	assign carryout = C[n+1];	//was C[n];
	
	generate
		for(i = 0;i <= n-1;i=i+1)
		begin:
			addbit fullAdder stage(C[i], Xin[i],Yin[i], S[i], C[i+1]);
		end
	endgenerate
		
endmodule
