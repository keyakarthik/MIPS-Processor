`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:57:51 04/05/2021
// Design Name:   PC
// Module Name:   C:/Users/onanga/Desktop/Xilinx_ISE_DS_14.7_1015_1/Projects/Five_Stage_Pipelined_Processor/PC_tb.v
// Project Name:  Five_Stage_Pipelined_Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_tb;

	// Inputs
	reg clk;
	reg RST;
	reg [31:0] PC_in;
	reg PCWrite;

	// Outputs
	wire [31:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.RST(RST), 
		.OUT(OUT), 
		.PC_in(PC_in), 
		.PCWrite(PCWrite)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		RST = 0;
		PC_in = 0;
		PCWrite = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

