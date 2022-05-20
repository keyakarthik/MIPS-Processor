
module Program_Counter (clk,RST,OUT,PC_in,PCWrite); 
 
 input clk,RST,PCWrite;
 input [31:0] PC_in;
 output reg [31:0] OUT;
 
always@(posedge clk or posedge RST) 

	if(RST) 
		OUT<=32'd0;				//Gets address of next instruction on Fetch
	else if (PCWrite == 0)
		begin
			
			OUT<=PC_in[31:0];			//Branch Condition
		end
		
 endmodule
 

