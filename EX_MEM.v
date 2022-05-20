
module EX_MEM(clock,rst, MemtoReg,EXMEM, zero, ALUout, ReadData2, WriteReg, RegWrite,MemRead,MemWrite);

input clock, rst, zero, RegWrite,MemRead,MemWrite,MemtoReg;
input [31:0] ALUout,ReadData2;
input [4:0] WriteReg;
output reg [73:0] EXMEM;



always @(posedge clock, posedge rst)
begin

if(rst==1) 
	EXMEM = 0;
else if (clock ==1) begin 
	EXMEM[0]		<= zero;
	EXMEM[32:1]	<= ALUout;
	EXMEM[64:33]<= ReadData2;
	EXMEM[69:65]<= WriteReg;
	EXMEM[70]	<= RegWrite;
	EXMEM[71]	<= MemRead;
	EXMEM[72]	<= MemWrite;
	EXMEM[73]	<= MemtoReg;	
end
end
endmodule

