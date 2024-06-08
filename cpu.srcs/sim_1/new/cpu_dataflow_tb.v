`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 23:29:15
// Design Name: 
// Module Name: cpu_dataflow_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cpu_dataflow_tb();
reg clk = 0;
reg [31:0] instruction;
reg regWrite;
reg ALUScr;
reg [3:0] op;
reg memWrite;
reg memRead;
reg memtoReg;
reg RegDst;

wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] read_data;
wire [4:0] cmd_mux;
wire [31:0] ALU_mux;
wire [31:0] DATA_mux;
wire [31:0] ALU_result;
wire zero;

cpu_dataflow UUT(
    .clk(clk),
    .instruction(instruction),
    .regWrite(regWrite),
    .ALUScr(ALUScr),
    .op(op),
    .memWrite(memWrite),
    .memRead(memRead),
    .memtoReg(memtoReg),
    .RegDst(RegDst),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .read_data(read_data),
    .cmd_mux(cmd_mux),
    .ALU_mux(ALU_mux),
    .DATA_mux(DATA_mux),
    .ALU_result(ALU_result),
    .zero(zero)
);

always #5 clk = ~clk;

initial begin
    regWrite = 1'b0;op = 4'b0;
    memWrite = 1'b0;memRead = 1'b0;
    ALUScr = 1'b0;memtoReg = 1'b0;RegDst = 1'b0;
    instruction = 32'b000000_00000_00000_00000_00000000000;  #10;
    //data_reg 1 3
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b0;            
    op = 4'b0001;            
    ALUScr = 1'b1;memtoReg = 1'b0;RegDst = 1'b0;
    instruction = 32'b000000_00000_00001_00000_00000000011;  #5;
    regWrite = 1'b1;memWrite = 1'b0;memRead = 1'b0;          #5;
    //data_reg 2 5
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b0;            
    op = 4'b0001;                 
    ALUScr = 1'b1;memtoReg = 1'b0;RegDst = 1'b0;
    instruction = 32'b000000_00000_00010_00000_00000000101;  #5;
    regWrite = 1'b1;memWrite = 1'b0;memRead = 1'b0;          #5;
    
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b0;            
    op = 4'b0010;                 
    ALUScr = 1'b0;memtoReg = 1'b0;RegDst = 1'b1;
    instruction = 32'b000000_00001_00010_00011_00000000000;  #5;
    regWrite = 1'b1;memWrite = 1'b0;memRead = 1'b0;          #5;
    
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b0;            
    op = 4'b0001;                 
    ALUScr = 1'b1;memtoReg = 1'b0;RegDst = 1'b0;
    instruction = 32'b000000_00000_00011_00000_00000000000;  #5;
    regWrite = 1'b0;memWrite = 1'b1;memRead = 1'b0;          #5;
    
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b0;            
    op = 4'b0001;                 
    ALUScr = 1'b1;memtoReg = 1'b0;RegDst = 1'b0;
    instruction = 32'b000000_00000_00000_00000_00000000000;  #5;
    regWrite = 1'b0;memWrite = 1'b0;memRead = 1'b1;          #5;        
    
    $finish;
end
endmodule
