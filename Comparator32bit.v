
module Comparator32bit(muxRs_out, muxRt_out,BranchTaken);
parameter word_size=32;
input [word_size-1:0] muxRs_out, muxRt_out;
output reg BranchTaken;

always@(*)
	begin
	if(muxRs_out == muxRt_out) begin
		BranchTaken = 1;
		end
	else
	begin
		BranchTaken = 0;
   end
end
		
		

endmodule
