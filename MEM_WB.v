
module MEM_WB(clock,rst,MemtoReg, WriteReg, RegWrite, ReadData, MEMWB,address);

input [31:0] ReadData,address;
input [4:0] WriteReg;
input RegWrite,clock,rst,MemtoReg;
output reg [70:0] MEMWB;

always @(posedge clock, posedge rst)
begin

if(rst==1) 
	MEMWB = 0;
else if (clock ==1) begin 

MEMWB[31:0]	<=	 ReadData;
MEMWB[70]	<=	 MemtoReg;
MEMWB[36:32]<=	 WriteReg;
MEMWB[37]   <=  RegWrite;
MEMWB[69:38]<=	 address;

end
end

endmodule

