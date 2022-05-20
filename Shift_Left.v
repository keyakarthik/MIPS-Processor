
module shift_left2(shifted_address, sign_extended_address);

output [31:0] shifted_address;
input [31:0] sign_extended_address;

assign shifted_address = sign_extended_address << 2;

endmodule
