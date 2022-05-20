`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:48 04/14/2021 
// Design Name: 
// Module Name:    Data_Hazard_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////
module Data_Hazard_Unit(Branch,IFID_RegisterRs,IFID_RegisterRt,IDEX_RegisterRt,IDEX_RegisterRd,EXMEM_RegisterRd,MEMWB_RegisterRd, IDEX_MemRead,EXMEM_MemRead,IDEX_RegWrite,EXMEM_RegWrite,MEMWB_RegWrite, PCWrite, IFIDWrite,IDEXZero,ForwardRs,ForwardRt);
input  Branch, IDEX_MemRead,EXMEM_MemRead,IDEX_RegWrite,EXMEM_RegWrite,MEMWB_RegWrite;
input [4:0] IFID_RegisterRs,IFID_RegisterRt,IDEX_RegisterRt,IDEX_RegisterRd,EXMEM_RegisterRd,MEMWB_RegisterRd;
output reg PCWrite, IFIDWrite,IDEXZero;
output reg [1:0]ForwardRs,ForwardRt;

always@(*) begin

if(IDEX_MemRead && ((IDEX_RegisterRt == IFID_RegisterRs) ||(IDEX_RegisterRt == IFID_RegisterRt)))
begin
PCWrite=1;
IFIDWrite =1;
IDEXZero =1;
end

//ID branch data hazard condition:
else if (Branch  && IDEX_RegWrite && (IDEX_RegisterRd != 0) && (IDEX_RegisterRd == IFID_RegisterRs)) 
begin
PCWrite=1;
IFIDWrite =1;
IDEXZero =1;
end
else if (Branch && IDEX_RegWrite && (IDEX_RegisterRd != 0) && (IDEX_RegisterRd == IFID_RegisterRt)) 
begin
PCWrite=1;
IFIDWrite =1;
IDEXZero =1;
end

//BEQ instruction requires an additional stall in the case of a branch data hazard:
else if (Branch  && EXMEM_MemRead  &&((EXMEM_RegisterRd == IFID_RegisterRs) || (EXMEM_RegisterRd == IFID_RegisterRt))) 
begin
PCWrite=1;
IFIDWrite =1;
IDEXZero =1;
end
else 
begin
PCWrite=0;
IFIDWrite =0;
IDEXZero =0;
end
//EX branch data hazard condition:
 if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 0) && (EXMEM_RegisterRd == IFID_RegisterRs)) 
begin
ForwardRs = 2'b10;
end
else if ((MEMWB_RegWrite && (MEMWB_RegisterRd != 0)) && !(EXMEM_RegWrite && (EXMEM_RegisterRd != 0))
  && (MEMWB_RegisterRd == IFID_RegisterRs) && (EXMEM_RegisterRd == IFID_RegisterRs)) 
begin
ForwardRs = 2'b01;
end
else 
begin
 ForwardRs = 2'b00;
 end
//MEM branch data hazard condition:
if ((EXMEM_RegWrite) && (EXMEM_RegisterRd != 0) && (EXMEM_RegisterRd == IFID_RegisterRt)) 
begin
ForwardRt = 2'b10;
end
else if ((MEMWB_RegWrite && (MEMWB_RegisterRd != 0)) && !(EXMEM_RegWrite && (EXMEM_RegisterRd != 0))
  && (MEMWB_RegisterRd == IFID_RegisterRt) && (EXMEM_RegisterRd == IFID_RegisterRt))
 begin
 ForwardRt = 2'b01;
end
else 
begin
 ForwardRt = 2'b00;
end


end
endmodule
