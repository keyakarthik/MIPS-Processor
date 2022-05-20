
module PC_Branch_mux( PC_adder_out, Branch_adder_out,Mux_out, BranchTaken,Branch,IDEXZero );
input [31:0] PC_adder_out, Branch_adder_out;
input BranchTaken,Branch, IDEXZero ;
output reg [31:0] Mux_out;

wire sel;

assign sel =  BranchTaken && Branch && !(IDEXZero);

always@(*) begin
 if(sel)
	begin
		Mux_out <= Branch_adder_out;
	end
else
	Mux_out <= PC_adder_out;
end

endmodule

