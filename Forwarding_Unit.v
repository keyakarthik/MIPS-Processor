

module Forwarding_Unit(ID_EX_RegisterRs, ID_EX_RegisterRt, EX_MEM_RegisterRd,EX_MEM_RegWrite,MEM_WB_RegisterRd,MEM_WB_RegWrite,ForwardA,ForwardB);
input [4:0] ID_EX_RegisterRs, ID_EX_RegisterRt, EX_MEM_RegisterRd,MEM_WB_RegisterRd;
input EX_MEM_RegWrite,MEM_WB_RegWrite;
output reg [1:0] ForwardA, ForwardB ;
    
	 
always @(*) begin
		
	if ((EX_MEM_RegWrite == 1'b1) && (EX_MEM_RegisterRd != 5'b00000) && (EX_MEM_RegisterRd == ID_EX_RegisterRs)) //EX Data Hazard Condition
		begin
			ForwardA = 2'b10;
		end
	else if((MEM_WB_RegWrite == 1'b1) && (MEM_WB_RegisterRd != 5'b00000)&& !((EX_MEM_RegWrite ==1'b1) && (EX_MEM_RegisterRd !=5'b00000) && (EX_MEM_RegisterRd == ID_EX_RegisterRs)) && (MEM_WB_RegisterRd == ID_EX_RegisterRs)) //MEM Data Hazard Condition
		begin
			ForwardA = 2'b01;
		end
	else
	begin
	ForwardA = 2'b00;
	end
	if ((EX_MEM_RegWrite == 1'b1) && (EX_MEM_RegisterRd != 5'b00000) && (EX_MEM_RegisterRd == ID_EX_RegisterRt)) //EX Data Hazard Condition
		begin
			ForwardB = 2'b10;
		end
	
	else if((MEM_WB_RegWrite == 1'b1) && (MEM_WB_RegisterRd != 5'b00000)&& !((EX_MEM_RegWrite == 1'b1) && (EX_MEM_RegisterRd !=5'b00000) && (EX_MEM_RegisterRd == ID_EX_RegisterRt)) && (MEM_WB_RegisterRd == ID_EX_RegisterRt)) //MEM Data Hazard Condition
		begin
			ForwardB = 2'b01;
		end
else
begin
ForwardB = 2'b00;
end		
		

end

endmodule
