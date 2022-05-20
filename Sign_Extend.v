
module Sign_Extend( IR, Sign_Extnd_out);
	input [15:0] IR ;
	output reg [31:0] Sign_Extnd_out ;
	
	always @(IR) begin
						if(IR[15]) begin
							Sign_Extnd_out <= {16'hFFFF, IR} ;
							end
						else begin
							Sign_Extnd_out <= {16'h0000, IR} ;
							end
						
						end
endmodule


