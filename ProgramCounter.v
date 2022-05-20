`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:01 02/25/2022 
// Design Name: 
// Module Name:    ProgramCounter 
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
//
//////////////////////////////////////////////////////////////////////////////////
module ProgramCounter(
 input [31:0] data_in,
input rst, clk, ld,
output reg [31:0] data_out
);

always@(posedge clk)
begin
    if (rst)
        data_out = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    else if (ld)
        data_out = data_in;
    else
        data_out = data_out;
end

endmodule
 
 
 
 
 
 
 
 
 /*   input [31:0] PC_in,
    input clk,
    input INC,	 //increments PC by 1
    //input PC_LD,
	 input offset,
	 input [31:0] offset_value,
    input reset,
    output reg [31:0] PC_out
    );
always@(posedge clk)
  begin
  if (reset)
    PC_out = 32'h0000_0000;
  //else if (PC_LD)
  //  PC_out = PC_IN;
  else if (INC &&(~offset))
    PC_out = PC_out+4; 
  else if (offset)
   PC_out=PC_in+4+offset_value;
  else
    PC_out = PC_out;
end
*/

