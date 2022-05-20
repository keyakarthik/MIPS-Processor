

module MIPS_ALU (ALUctl, A, B, ALUout, Zero, Overflow);	

input [3:0] ALUctl;
input [31:0] A,B;
output [31:0] ALUout;
output Zero;
output Overflow;


wire [32:0] Cout;

	
		assign Cout[0] = ALUctl[1] & ALUctl[2];	//To generate CarryIn for the subtraction operation


genvar i;


//Instantiating the One_bit_ALU module 32 times.
generate 
	for (i=0; i<32; i=i+1)
		begin
	
		One_bit_ALU alu_one_bit(.a(A[i]), .b(B[i]), .CarryIn(Cout[i]), .ctrl_wrd(ALUctl), .CarryOut(Cout[i+1'b1]), .Result(ALUout[i]));
	
	end
endgenerate

assign Zero = ~|(ALUout);						// Determing the Zero output 

assign Overflow = Cout[32] ^ Cout[31];		// Determining the overflow with the xor of carryout from 2 MSB's


endmodule