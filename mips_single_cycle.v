module mips_single_cycle (reset, clock,PC);

input reset, clock ;
output [31:0] PC;
wire RegDst,MemRead,rst,MemtoReg, MemWrite, ALUSrc,RegWrite, Zero, Overflow,Branch,BranchTaken,true_branch_takken;
wire [4:0] WriteReg, RegDstMux_out;
wire [3:0] ALUctl;
wire [1:0] ALUop;
wire [124:0] IDEX;
wire [70:0] MEMWB;
wire [73:0] EXMEM;
wire [31:0] ReadData1, ReadData2,Inst, WriteData,ALUout,Sign_Extnd_Out,ALUIn2,PC_adder_out,data_mem_out;
wire PC_Write, IFID_Write,IDEX_Zero;
wire [8:0] controlsignals,True_controlsignals;
wire [1:0]ForwardA,ForwardB,ForwardRs,ForwardRt;
wire [31:0] ForwardmuxA_out,ForwardmuxB_out,ForwardmuxRs_out,ForwardmuxRt_out,shift_left_out,Branch_Addr_Out,Branch_PC_mux_out,IDEX_instruction,PC_addr_IDEX;
wire [63:0] Instruction;

assign True_controlsignals = {ALUop,RegWrite,RegDst,Branch,MemRead, MemtoReg, MemWrite, ALUSrc};
assign rst = ~reset;

// IF stage 
PC_Branch_mux PC_Mux(.PC_adder_out(PC_adder_out), .Branch_adder_out(Branch_Addr_Out),.Mux_out(Branch_PC_mux_out),.BranchTaken(BranchTaken) , .Branch(Branch), .IDEXZero(IDEX_Zero));
Program_Counter ProgramCounter(.clk(clock), .RST(reset),.PC_in(Branch_PC_mux_out), .OUT(PC),.PCWrite(PC_Write));
PC_Adder PCadder(.PC_in(PC), .PC_adder_out(PC_adder_out));
Inst_mem i_mem(.i_adr(PC), .o_dat(Inst));

// ID stage

assign true_branch_takken = Branch & BranchTaken;

IF_ID IFID_stage(.clock(clock), .reset(reset),.IFID(Instruction), .Inst(Inst),.PC_addr_out(PC_adder_out),.IFIDWrite(IFID_Write),.branchtakken(true_branch_takken));
regfile rfile(.clock(clock), .reset(rst), .RegWrite(MEMWB[37]), .ReadReg1(Instruction[25:21]), .ReadReg2(Instruction[20:16]), .WriteReg(MEMWB[36:32]), 
.WriteData(WriteData), .ReadData1(ReadData1),.ReadData2(ReadData2));
ControlUnit CU(.OpCode(Instruction[31:26]), .ALUop(ALUop),.RegWrite(RegWrite), .RegDst(RegDst), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg),
 .MemWrite(MemWrite), .ALUSrc(ALUSrc));
 
control_hazard_mux Hazard_cntl_mux1 (.Inp_Zero(True_controlsignals),.cntl_Mux_out(controlsignals),.Select(IDEX_Zero));

Sign_Extend sign_ext(.IR(Instruction[15:0]),.Sign_Extnd_out(Sign_Extnd_Out));
shift_left2 Shift_Left(.shifted_address(shift_left_out), .sign_extended_address(Sign_Extnd_Out));
branch_adder Branch_Addr(.branch_address(Branch_Addr_Out), .shifted_left_out(shift_left_out), .incremented_PC_addr(Instruction[63:32]));

//EX 

ID_EX IDEX_stage(.clock(clock),.IDEX_instruction(IDEX_instruction),
.instruction(Instruction[31:0]),.rst(reset),.RegDst(controlsignals[5]), .MemtoReg(controlsignals[2]), .ALUSrc(controlsignals[0]), .Sign_Extnd_Out(Sign_Extnd_Out),
 .ForwardmuxRs_out(ForwardmuxRs_out), .ForwardmuxRt_out(ForwardmuxRt_out), .IFID_rd(Instruction[15:11])/*rd */, .RegWrite(controlsignals[6]), .ALUop(controlsignals[8:7]),
 .FuncCode(Instruction[5:0]), .IDEX(IDEX), .MemWrite(controlsignals[1]), .MemRead(controlsignals[3]), .IFID_rt(Instruction[20:16]),.IDEXZero(IDEX_Zero),.IFID_rs(Instruction[25:21]));
ALU_mux AluMux(.ReadData2(ForwardmuxB_out), .Sign_Extnd_out(IDEX[111:80]), .ALUSrc(IDEX[117]), .ALUIn2(ALUIn2));
aluctl ctlALU( .Function(IDEX[71:66]), .Operation(IDEX[65:64]), .ALUctl(ALUctl));
RegDst_Mux RegDstMux(.in1(IDEX[116:112]), .in2(IDEX[76:72]), .out(RegDstMux_out), .Sel(IDEX[119]));
MIPS_ALU ALU32(.ALUctl(ALUctl), .A(ForwardmuxA_out), .B(ALUIn2), .ALUout(ALUout), .Zero(Zero), .Overflow(Overflow));


//MEM stage 

EX_MEM EXMEM1(.clock(clock),.rst(reset), .MemtoReg(IDEX[118]),.EXMEM(EXMEM), .zero(Zero), .ALUout(ALUout), .ReadData2(ForwardmuxB_out), .WriteReg(RegDstMux_out), .RegWrite(IDEX[77]), .MemWrite(IDEX[79]), .MemRead(IDEX[78]));
data_mem Data_Mem(.i_adr(EXMEM[32:1]), .i_dat(EXMEM[64:33]), .o_dat(data_mem_out), .R(EXMEM[71]), .W(EXMEM[72]));

//Write Back 

MEM_WB MEMWB1 (.clock(clock), .rst(reset), .MemtoReg(EXMEM[73]), .address(EXMEM[32:1]), .WriteReg(EXMEM[69:65]), .RegWrite(EXMEM[70]), .ReadData(data_mem_out), .MEMWB(MEMWB));
MemtoReg_Mux MemtoRegMux(.in1(MEMWB[69:38]), .in2(MEMWB[31:0]), .out(WriteData),.sel(MEMWB[70]));

// forwarding unit 

ForwardRsMux FwrdMuxRs(.mux_out(ForwardmuxRs_out), .ReadData1(ReadData1), .EXMEM_in(EXMEM[32:1]), .MEMWB_in(WriteData),.ForwardRs(ForwardRs));
ForwardRtMux FwrdMuxRt(.mux_out(ForwardmuxRt_out), .ReadData2(ReadData2), .EXMEM_in(EXMEM[32:1]), .MEMWB_in(WriteData),.ForwardRt(ForwardRt));
Comparator32bit Comparator(.muxRs_out(ForwardmuxRs_out), .muxRt_out(ForwardmuxRt_out),.BranchTaken(BranchTaken));

ForwardA_Mux FwrdMuxA(.mux_out(ForwardmuxA_out), .IDEX_in(IDEX[31:0]), .EXMEM_in(EXMEM[32:1]), .MEMWB_in(WriteData),.ForwardA(ForwardA));
ForwardB_Mux FwrdMuxB(.mux_out(ForwardmuxB_out), .IDEX_in(IDEX[63:32]), .EXMEM_in(EXMEM[32:1]), .MEMWB_in(WriteData),.ForwardB(ForwardB));

Forwarding_Unit FwrdUnit(.ID_EX_RegisterRs(IDEX[124:120]), .ID_EX_RegisterRt(IDEX[116:112]), .EX_MEM_RegisterRd(EXMEM[69:65]),.EX_MEM_RegWrite(EXMEM[70]),.MEM_WB_RegisterRd(MEMWB[36:32]),.MEM_WB_RegWrite(MEMWB[37]),.ForwardA(ForwardA),.ForwardB(ForwardB));

// Hazard Detection 
Data_Hazard_Unit DataHazard_Unit(.Branch(Branch),.IFID_RegisterRs(Instruction[25:21]),.IFID_RegisterRt(Instruction[20:16]),.IDEX_RegisterRt(IDEX[116:112]),.IDEX_RegisterRd(IDEX[76:72]),.EXMEM_RegisterRd(EXMEM[69:65]),.MEMWB_RegisterRd(MEMWB[36:32]),.IDEX_MemRead(IDEX[78]),.EXMEM_MemRead(EXMEM[71]),.IDEX_RegWrite(IDEX[77]),.EXMEM_RegWrite(EXMEM[70]),.MEMWB_RegWrite(MEMWB[37]), .PCWrite(PC_Write),.IFIDWrite(IFID_Write),.IDEXZero(IDEX_Zero),.ForwardRs(ForwardRs),.ForwardRt(ForwardRt));

endmodule













