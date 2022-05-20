`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:32:49 04/22/2022 
// Design Name: 
// Module Name:    Mux_32bit_2inputs 
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
module Mux_32bit_2inputs(
 input [31:0] a,
    input [31:0] b,
    input select,
    output reg [31:0] muxout
    );
always@(*)
begin
if(select==1'b0) muxout = a; else
if(select==1'b1)muxout=b;
end

endmodule
