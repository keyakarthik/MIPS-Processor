
module ForwardB_Mux(mux_out, IDEX_in, EXMEM_in, MEMWB_in,ForwardB);
	output reg [31:0]mux_out;
	input [31:0] IDEX_in, EXMEM_in, MEMWB_in;
	input[1:0] ForwardB;
	always @ (*)
	case(ForwardB)
	2'b00: mux_out <= IDEX_in;
	2'b10: mux_out <= EXMEM_in;
	2'b01: mux_out <= MEMWB_in;
	default: mux_out <= IDEX_in;
	endcase
endmodule
