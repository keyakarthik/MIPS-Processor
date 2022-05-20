`timescale 1ns / 1ps

module testbench;

reg reset, clock;
reg [7:0] clk_count = 'd0;
wire [31:0] PC;

mips_single_cycle single_cycle_tb(reset, clock,PC);
always @ ( posedge clock )
clk_count <= clk_count + 1'd1;
initial
begin
// initialize and run clock
reset = 1;
clock = 0;
repeat (128)
#5 clock = ~clock;
end

  
initial
#7 reset = 0;

//initial
//begin
// deassert reset
// simulate switch changes
//
// SEQUENCE 1;
//#15 Instruction = 32'b00000000010000110000100000100000;
//#10 Instruction = 32'b00000000101001100010000000100010;
//#10 Instruction = 32'b00000001000010010011100000100100;
//#10 Instruction = 32'b00000000001011000101000000100101;
//#10 Instruction = 32'b00000000100100011000000000100111;

/*
#15 Instruction = 32'b00000000010000110000100000100000;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000001001100010000000100010;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000001001000011100000100100;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000111001110101000000100101;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000000000000000000000000000000;
#10 Instruction = 32'b00000001010001001000000000100111;
end
*/




initial #550 $finish;

endmodule


