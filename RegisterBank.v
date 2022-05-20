module register_reset (reg_in, reg_out, reset, clock, Enable);

input [31:0] reg_in;
input reset, clock, Enable;
output reg [31:0] reg_out;


parameter DV = 0;

always@(negedge clock, negedge reset)
begin
		if (!reset)
			reg_out <= DV;
			
		else if(Enable)
			reg_out <= reg_in;
		
end
endmodule

module regfile (clock, reset, RegWrite, ReadReg1, ReadReg2, WriteReg, WriteData, ReadData1, ReadData2);

input clock, reset, RegWrite;
input [4:0] ReadReg1, ReadReg2, WriteReg;
input [31:0] WriteData;
output reg [31:0] ReadData1, ReadData2;
wire [31:0] Register_out[31:0];
reg [31:0] decoder_out;
wire [31:0] load;

register_reset #(.DV(0))  R0 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[0]), .reg_out(Register_out[0]));
register_reset #(.DV(6))  R1 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[1]), .reg_out(Register_out[1]));
register_reset #(.DV(7))  R2 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[2]), .reg_out(Register_out[2]));
register_reset #(.DV(8))  R3 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[3]), .reg_out(Register_out[3]));
register_reset #(.DV(9))  R4 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[4]), .reg_out(Register_out[4]));
register_reset #(.DV(10))  R5 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[5]), .reg_out(Register_out[5]));
register_reset #(.DV(11))  R6 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[6]), .reg_out(Register_out[6]));
register_reset #(.DV(12))  R7 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[7]), .reg_out(Register_out[7]));
register_reset #(.DV(13))  R8 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[8]), .reg_out(Register_out[8]));
register_reset #(.DV(14))  R9 (.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[9]), .reg_out(Register_out[9]));
register_reset #(.DV(15)) R10(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[10]),.reg_out(Register_out[10]));
register_reset #(.DV(16)) R11(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[11]),.reg_out(Register_out[11]));
register_reset #(.DV(17)) R12(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[12]),.reg_out(Register_out[12]));
register_reset #(.DV(18)) R13(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[13]),.reg_out(Register_out[13]));
register_reset #(.DV(19)) R14(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[14]),.reg_out(Register_out[14]));
register_reset #(.DV(20)) R15(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[15]),.reg_out(Register_out[15]));
register_reset #(.DV(21)) R16(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[16]),.reg_out(Register_out[16]));
register_reset #(.DV(22)) R17(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[17]),.reg_out(Register_out[17]));
register_reset #(.DV(23)) R18(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[18]),.reg_out(Register_out[18]));
register_reset #(.DV(24)) R19(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[19]),.reg_out(Register_out[19]));
register_reset #(.DV(25)) R20(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[20]),.reg_out(Register_out[20]));
register_reset #(.DV(26)) R21(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[21]),.reg_out(Register_out[21]));
register_reset #(.DV(27)) R22(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[22]),.reg_out(Register_out[22]));
register_reset #(.DV(28)) R23(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[23]),.reg_out(Register_out[23]));
register_reset #(.DV(29)) R24(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[24]),.reg_out(Register_out[24]));
register_reset #(.DV(30)) R25(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[25]),.reg_out(Register_out[25]));
register_reset #(.DV(31)) R26(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[26]),.reg_out(Register_out[26]));
register_reset #(.DV(32)) R27(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[27]),.reg_out(Register_out[27]));
register_reset #(.DV(33)) R28(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[28]),.reg_out(Register_out[28]));
register_reset #(.DV(34)) R29(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[29]),.reg_out(Register_out[29]));
register_reset #(.DV(35)) R30(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[30]),.reg_out(Register_out[30]));
register_reset #(.DV(36)) R31(.reset(reset), .reg_in(WriteData), .clock(clock), .Enable(load[31]),.reg_out(Register_out[31]));

always @*
begin
			case (WriteReg)
					  5'h0  : decoder_out = 32'h0000_0001;
					  5'h1  : decoder_out = 32'h0000_0002;
					  5'h2  : decoder_out = 32'h0000_0004;
					  5'h3  : decoder_out = 32'h0000_0008;
					  5'h4  : decoder_out = 32'h0000_0010;
					  5'h5  : decoder_out = 32'h0000_0020;
					  5'h6  : decoder_out = 32'h0000_0040;
					  5'h7  : decoder_out = 32'h0000_0080;
					  5'h8  : decoder_out = 32'h0000_0100;
					  5'h9  : decoder_out = 32'h0000_0200;
					  5'hA  : decoder_out = 32'h0000_0400;
					  5'hB  : decoder_out = 32'h0000_0800;
					  5'hC  : decoder_out = 32'h0000_1000;
					  5'hD  : decoder_out = 32'h0000_2000;
					  5'hE  : decoder_out = 32'h0000_4000;
					  5'hF  : decoder_out = 32'h0000_8000;
					  5'h10 : decoder_out = 32'h0001_0000;
					  5'h11 : decoder_out = 32'h0002_0000;
					  5'h12 : decoder_out = 32'h0004_0000;
					  5'h13 : decoder_out = 32'h0008_0000;
					  5'h14 : decoder_out = 32'h0010_0000;
					  5'h15 : decoder_out = 32'h0020_0000;
					  5'h16 : decoder_out = 32'h0040_0000;
					  5'h17 : decoder_out = 32'h0080_0000;
					  5'h18 : decoder_out = 32'h0100_0000;
					  5'h19 : decoder_out = 32'h0200_0000;
					  5'h1A : decoder_out = 32'h0400_0000;
					  5'h1B : decoder_out = 32'h0800_0000;
					  5'h1C : decoder_out = 32'h1000_0000;
					  5'h1D : decoder_out = 32'h2000_0000;
					  5'h1E : decoder_out = 32'h4000_0000;
					  5'h1F : decoder_out = 32'h8000_0000;
			  endcase
	
end

genvar a;
generate
	for (a=0; a<=31; a=a+1)
	begin
		and(load[a], RegWrite, decoder_out[a]);
	end
endgenerate

always @*
begin

case (ReadReg1)
		5'b00000 : ReadData1 = Register_out[0];  
		5'b00001 : ReadData1 = Register_out[1];
		5'b00010 : ReadData1 = Register_out[2];
		5'b00011 : ReadData1 = Register_out[3];
		5'b00100 : ReadData1 = Register_out[4];
		5'b00101 : ReadData1 = Register_out[5];
		5'b00110 : ReadData1 = Register_out[6];
		5'b00111 : ReadData1 = Register_out[7];
		5'b01000 : ReadData1 = Register_out[8];
		5'b01001 : ReadData1 = Register_out[9];
		5'b01010 : ReadData1 = Register_out[10];
		5'b01011 : ReadData1 = Register_out[11];
		5'b01100 : ReadData1 = Register_out[12];
		5'b01101 : ReadData1 = Register_out[13];
		5'b01110 : ReadData1 = Register_out[14];
		5'b01111 : ReadData1 = Register_out[15];
		5'b10000 : ReadData1 = Register_out[16];
		5'b10001 : ReadData1 = Register_out[17];
		5'b10010 : ReadData1 = Register_out[18];
		5'b10011 : ReadData1 = Register_out[19];
		5'b10100 : ReadData1 = Register_out[20];
		5'b10101 : ReadData1 = Register_out[21];
		5'b10110 : ReadData1 = Register_out[22];
		5'b10111 : ReadData1 = Register_out[23];
		5'b11000 : ReadData1 = Register_out[24];
		5'b11001 : ReadData1 = Register_out[25];
		5'b11010 : ReadData1 = Register_out[26];
		5'b11011 : ReadData1 = Register_out[27];
		5'b11100 : ReadData1 = Register_out[28];
		5'b11101 : ReadData1 = Register_out[29];
		5'b11110 : ReadData1 = Register_out[30];
		5'b11111 : ReadData1 = Register_out[31];
endcase

end

always @*
begin

case (ReadReg2)
		5'b00000 : ReadData2 = Register_out[0]; 
		5'b00001 : ReadData2 = Register_out[1]; 
		5'b00010 : ReadData2 = Register_out[2]; 
		5'b00011 : ReadData2 = Register_out[3]; 
		5'b00100 : ReadData2 = Register_out[4]; 
		5'b00101 : ReadData2 = Register_out[5]; 
		5'b00110 : ReadData2 = Register_out[6]; 
		5'b00111 : ReadData2 = Register_out[7]; 
		5'b01000 : ReadData2 = Register_out[8]; 
		5'b01001 : ReadData2 = Register_out[9]; 
		5'b01010 : ReadData2 = Register_out[10];
		5'b01011 : ReadData2 = Register_out[11];
		5'b01100 : ReadData2 = Register_out[12];
		5'b01101 : ReadData2 = Register_out[13];
		5'b01110 : ReadData2 = Register_out[14];
		5'b01111 : ReadData2 = Register_out[15];
		5'b10000 : ReadData2 = Register_out[16];
		5'b10001 : ReadData2 = Register_out[17];
		5'b10010 : ReadData2 = Register_out[18];
		5'b10011 : ReadData2 = Register_out[19];
		5'b10100 : ReadData2 = Register_out[20];
		5'b10101 : ReadData2 = Register_out[21];
		5'b10110 : ReadData2 = Register_out[22];
		5'b10111 : ReadData2 = Register_out[23];
		5'b11000 : ReadData2 = Register_out[24];
		5'b11001 : ReadData2 = Register_out[25];
		5'b11010 : ReadData2 = Register_out[26];
		5'b11011 : ReadData2 = Register_out[27];
		5'b11100 : ReadData2 = Register_out[28];
		5'b11101 : ReadData2 = Register_out[29];
		5'b11110 : ReadData2 = Register_out[30];
		5'b11111 : ReadData2 = Register_out[31];
endcase
end

endmodule
