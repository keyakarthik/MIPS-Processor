
`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// Create Date:   21:10:03 03/22/2021
// Designer Name: Ooshma Nanga
// Module Name:   ControlUnit
// Project Name: Single Cycle Register Bank/ALU
///////////////////////////////////////////////////////
module ControlUnit(OpCode,ALUop,RegWrite,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc);

input [5:0] OpCode;
output reg [1:0] ALUop;
output reg RegWrite,RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc;

always @(*)

	case(OpCode)
	6'b000000 : //R-type
		begin
		ALUop		= 2'b10;
		RegWrite = 1'b1;
		ALUSrc	= 1'b0;
		RegDst	= 1'b1;
		MemRead	= 1'b0;
		MemtoReg	= 1'b0;
		MemWrite	= 1'b0;
		Branch  = 1'b0;

		end
	6'b100011 : // Lw- load Word
		begin
		ALUop 	= 2'b00;
		RegWrite = 1'b1;
		ALUSrc	= 1'b1;
		RegDst	= 1'b0;
		MemRead	= 1'b1;
		MemtoReg	= 1'b1;
		MemWrite	= 1'b0;
		Branch   = 1'b0;
		end
			
	6'b101011 :  //SW store Word
		begin
		ALUop	 	= 2'b00;
		RegWrite = 1'b0;
		ALUSrc	= 1'b1;
		RegDst	= 1'bx;
		MemRead	= 1'b0;
		MemtoReg	= 1'bx;
		MemWrite	= 1'b1;
		Branch   = 1'b0;
		end
	
	6'b000100 : //beq - Branch equal
		begin
		ALUop		= 2'b01;
		RegWrite = 1'b0;
		ALUSrc	= 1'b0;
		RegDst	= 1'bx;
		MemRead	= 1'b0;
		MemtoReg	= 1'bx;
		MemWrite	= 1'b0;
		Branch   = 1'b1;
		end
	default:begin
		ALUop		= 2'b10;
		RegWrite = 1'b0;
		ALUSrc	= 1'b0;
		RegDst	= 1'b0;
		MemRead	= 1'b0;
		MemtoReg	= 1'b0;
		MemWrite	= 1'b0;
		Branch   = 1'b0;
		end
	
		
	endcase
	
endmodule
