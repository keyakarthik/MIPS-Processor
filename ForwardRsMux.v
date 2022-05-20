
module ForwardRsMux(mux_out, ReadData1, EXMEM_in, MEMWB_in,ForwardRs);
	output reg [31:0] mux_out;
	input [31:0] ReadData1, EXMEM_in, MEMWB_in;
	input[1:0] ForwardRs;
	always @ (*)
	case(ForwardRs)
	2'b00: mux_out <= ReadData1;
	2'b10: mux_out <= EXMEM_in;
	2'b01: mux_out <= MEMWB_in;
	default: mux_out <= ReadData1;
	endcase
endmodule

