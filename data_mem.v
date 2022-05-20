
module data_mem(i_adr, i_dat, o_dat, R, W);

	input		[31:0] i_adr;
	input		[31:0] i_dat;
	output reg	[31:0] o_dat;
	input 	R, W;

	reg [31:0] Mem [0:63];

	always @ (R or W)
		if (R) 
			o_dat = Mem[i_adr];  //Read
		else if (W)
			Mem[i_adr] = i_dat;   //Write
		else o_dat = 32'bz;        //High impedance state
		
endmodule
