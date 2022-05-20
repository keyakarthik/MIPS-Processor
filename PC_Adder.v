
module PC_Adder(PC_in, PC_adder_out);

input [31:0] PC_in;
output reg [31:0] PC_adder_out;

always @(PC_in)
begin
	PC_adder_out <= PC_in + 4;
end

endmodule

