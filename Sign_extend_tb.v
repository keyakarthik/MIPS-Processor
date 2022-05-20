`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:14:46 04/01/2021
// Design Name:   Sign_Extend
// Module Name:   C:/Users/onanga/Desktop/Xilinx_ISE_DS_14.7_1015_1/Projects/Five_Stage_Pipelined_Processor/Sign_Extend_tb.v
// Project Name:  Five_Stage_Pipelined_Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sign_Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Sign_Extend_tb;

	// Inputs
	reg [15:0] IR;

	// Outputs
	wire [31:0] Sign_Extnd_out;

	// Instantiate the Unit Under Test (UUT)
	Sign_Extend uut (
		.IR(IR), 
		.Sign_Extnd_out(Sign_Extnd_out)
	);

	initial begin
	
		IR=0;
		#10;
		
		
		// Initialize Inputs
		IR = 16'b0000000000001000;
		#40
		IR = 16'b1111111100111000;
		#40

		// Wait 100 ns for global reset to finish
		#100
		
        
		// Add stimulus here

		$finish;
		end
      
endmodule

