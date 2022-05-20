
module RegDst_Mux(in1, in2, out, Sel);
input [4:0] in1,in2;
input Sel;
output reg [4:0] out;

always @(Sel,in1,in2)

begin
if(Sel)
	out <=	in2; 
else
	out <=	in1;
end

endmodule

