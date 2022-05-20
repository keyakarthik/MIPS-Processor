module One_bit_ALU (a, b, CarryIn, ctrl_wrd, CarryOut, Result);
	
	input a, b, CarryIn;
	input [3:0] ctrl_wrd; // 4bit control word to select operations
	output CarryOut, Result;
	wire Out_a, Out_b, cout, sum;
	wire In1, In2, In3;

		Mult2to1 a_Mux2x1(.In1(a), .Sel(ctrl_wrd[3]), .Out(Out_a));
		Mult2to1 b_Mux2x1(.In1(b), .Sel(ctrl_wrd[2]), .Out(Out_b));
		full_adder FA(.a(Out_a), .b(Out_b), .cin(CarryIn), .sum(In1), .cout(CarryOut));
		and_gate AND(.a(Out_a), .b(Out_b), .cout(In2));
		or_gate OR(.a(Out_a), .b(Out_b), .cout(In3));
		Mult4to1 Mux4x1(.TransferB(b), .In1(In1), .In2(In2), .In3(In3), .Sel(ctrl_wrd[1:0]), .Out(Result) );
		
endmodule


// 2X1 MULTIPLEXER
module Mult2to1(In1,Sel,Out);
	input In1,Sel;
	output reg Out;
	
always @(In1,Sel)

	begin
	case (Sel)
	1'b0 : Out <= In1;
	1'b1 : Out <= ~In1;
	endcase
	
end
endmodule


//AND GATE
module and_gate (a, b, cout);
	input a, b;
	output cout;

	assign cout = a & b; // AND operation of a and b

endmodule
//OR GATE
module or_gate (a, b, cout);
	input a, b;
	output cout;
		
		assign cout = a | b; // OR operation of a and b
		
endmodule
// 4to1 MUX
module Mult4to1(TransferB, In1, In2, In3, Sel, Out );
	input In1, In2, In3, TransferB;
	input[1:0] Sel; //Two LSB bits of ctrl_wrd to select operation
	output reg Out;
	
always @( TransferB, In1, In2, In3, Sel ) //sensitivity list of In1, In2, In3, Sel inputs
	begin
	case( Sel )
	2'b00 : Out <= In2; //Selects the AND gate output
	2'b01 : Out <= In3; //Selects the OR gate output
	2'b10 : Out <= In1; //Selects the Full ADDER output
	2'b11 : Out <= TransferB;
	endcase
end
endmodule
//FULL ADDER

module full_adder ( a, b, cin, sum, cout );
input a, b, cin;
output cout, sum;

	assign sum = a^b^cin; //SUM
	assign cout = (b & cin) | (a & cin) |(a & b); //CARRYOUT
	
endmodule