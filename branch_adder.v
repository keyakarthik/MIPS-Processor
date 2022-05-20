
module branch_adder(branch_address, shifted_left_out, incremented_PC_addr);

output [31:0] branch_address;
input [31:0] shifted_left_out, incremented_PC_addr;

assign branch_address = shifted_left_out + incremented_PC_addr;

endmodule
