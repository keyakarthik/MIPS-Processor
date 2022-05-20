`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:33:26 04/29/2022 
// Design Name: 
// Module Name:    four_input_mux 
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
module four_input_mux(
 input [31:0] a,
    input [31:0] b,
	 input [31:0] c,
	 input [31:0] d,
    input [1:0] select,
    output reg [31:0] muxout
    );
always@(*)
begin
if(select==2'b00) muxout = a; else
if(select==2'b01)muxout=b; else
if(select==2'b10)muxout=c; else
muxout=d; 
end


endmodule
