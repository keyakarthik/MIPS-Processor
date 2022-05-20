
module IF_ID(reset,clock,IFID,Inst,PC_addr_out,IFIDWrite,branchtakken);
input clock,reset,IFIDWrite,branchtakken;
input [31:0] Inst;
input [31:0] PC_addr_out;
output reg [63:0] IFID;

always @(posedge clock, posedge reset)
begin
	if(reset)
		IFID <= 32'd0;
	else if((clock == 1) && IFIDWrite == 0 && (branchtakken == 0)) 
	begin
		IFID = {PC_addr_out , Inst} ;
	end
	else if (branchtakken) 
	   IFID = {PC_addr_out , 32'd0} ;
end

endmodule

