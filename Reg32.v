`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Create Date:   21:10:03 03/31/2023
// Designer Name: Karthikeya Rajkumar
// Module Name:   Reg32
// Project Name: Three_Stage_Pipelined_MIPS
///////////////////////////////////////////////////////

module Reg32(
	 input rst,
    input [31:0] Reg_in,
	 input clk,
	 input Reg_select,
	 input Reg_write,
    output reg [31:0] Reg_out
    
 );
	 
	 
	 wire w1;
	 and (w1, Reg_select, Reg_write);
	 parameter DEFAULT = 32'b0000;
	 
	 always@(negedge clk)
	 begin
			if (rst==1)
			Reg_out = DEFAULT;
		else if(w1 && (clk==0))
			Reg_out = Reg_in;
		else
			Reg_out = Reg_out;
			
	end


endmodule
