
module ForwardRtMux(mux_out, ReadData2, EXMEM_in, MEMWB_in,ForwardRt);
	output reg [31:0] mux_out;
	input [31:0] ReadData2, EXMEM_in, MEMWB_in;
	input[1:0] ForwardRt;
	always @ (*)
	case(ForwardRt)
	2'b00: mux_out <= ReadData2;
	2'b10: mux_out <= EXMEM_in;
	2'b01: mux_out <= MEMWB_in;
	default: mux_out <= ReadData2;
	endcase
endmodule
