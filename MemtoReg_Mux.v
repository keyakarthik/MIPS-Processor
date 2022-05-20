
module MemtoReg_Mux(in1, in2, out, sel);

input [31:0] in1,in2;
input sel;
output reg [31:0] out;

always @(sel,in1,in2)

begin
if(sel)
	out <=	in2; 
else
	out <=	in1;
end
endmodule
