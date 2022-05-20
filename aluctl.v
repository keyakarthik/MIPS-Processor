


module aluctl(Function, Operation, ALUctl);
input [5:0] Function;
input [1:0] Operation;
output reg [3:0] ALUctl;

always @(*) begin
if(Operation == 2'b10) begin

			case(Function)
					6'b100000: ALUctl = 4'b0010;  //ADD
					6'b100010: ALUctl = 4'b0110;  //SUB
					6'b100100: ALUctl = 4'b0000;  //AND
					6'b100101: ALUctl = 4'b0001;  //OR
					6'b100111: ALUctl = 4'b1100;  //NOR
					
			endcase
			end
			else if (Operation == 2'b00)
					ALUctl = 4'b0010;
				else if (Operation == 2'b01)
					ALUctl = 4'b0110;
	
				end	
endmodule

