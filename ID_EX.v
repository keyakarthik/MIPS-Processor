
module ID_EX(clock,rst,IDEX_instruction,instruction,RegDst,MemtoReg,ALUSrc,Sign_Extnd_Out,ForwardmuxRs_out,ForwardmuxRt_out, IFID_rd, RegWrite, ALUop, FuncCode, IDEX,MemWrite,MemRead,Sign_Extnd_Out,ALUSrc,IFID_rt,IDEXZero,IFID_rs);

input [31:0] ForwardmuxRs_out, ForwardmuxRt_out,Sign_Extnd_Out,instruction;
input [1:0] ALUop;
input [5:0] FuncCode;
input [4:0] IFID_rt, IFID_rd,IFID_rs;
input RegWrite, rst,clock,MemWrite,MemRead,ALUSrc,MemtoReg,RegDst,IDEXZero;
output reg [124:0] IDEX;
output reg [31:0] IDEX_instruction;

always @(posedge clock, posedge rst)
begin
if(rst==1) 
	IDEX = 0;
else if (clock ==1) begin 

IDEX[31:0]	<=	 ForwardmuxRs_out;
IDEX[63:32]	<=	 ForwardmuxRt_out;
IDEX[65:64]	<=	 ALUop;
IDEX[71:66]	<=	 FuncCode;
IDEX[76:72]	<=	 IFID_rd; 
IDEX[77]		<=	 RegWrite;
IDEX[78]		<=	 MemRead;
IDEX[79]		<=	 MemWrite;
IDEX[111:80]<=	 Sign_Extnd_Out;
IDEX[116:112]<= IFID_rt; 
IDEX[117]	<=  ALUSrc;
IDEX[118]	<=  MemtoReg;
IDEX[119]	<=  RegDst;
IDEX[124:120] <= IFID_rs; 
IDEX_instruction <= instruction;

end

end

endmodule


