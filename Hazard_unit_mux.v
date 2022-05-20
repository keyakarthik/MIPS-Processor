

module control_hazard_mux(cntl_Mux_out, Inp_Zero, Select);

	output reg [8:0] cntl_Mux_out;
	input [8:0] Inp_Zero;
	input Select;
	
	always@(Inp_Zero, Select) begin
			case(Select)
					1'b0: cntl_Mux_out = Inp_Zero;
					1'b1: cntl_Mux_out = 9'b000000000;
				endcase
			end
endmodule 
					


