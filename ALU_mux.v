

module ALU_mux(ReadData2, Sign_Extnd_out, ALUSrc, ALUIn2);

input [31:0] ReadData2,Sign_Extnd_out;
input ALUSrc;
output reg [31:0] ALUIn2;


always @(ReadData2,Sign_Extnd_out,ALUSrc)
begin

if(ALUSrc)
	ALUIn2 <= Sign_Extnd_out;
else
	ALUIn2 <=  ReadData2;

end

endmodule

