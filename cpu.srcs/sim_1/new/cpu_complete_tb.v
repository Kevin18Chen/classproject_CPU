`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/04 14:27:23
// Design Name: 
// Module Name: cpu_complete
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


module cpu_complete_tb();
reg clk = 0;
reg reset;

wire [31:0] instruction;

wire regWrite;
wire ALUScr;
wire [3:0] op;
wire memWrite;
wire memRead;
wire memtoReg;
wire RegDst;
wire [31:0] pc;
wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] read_data;
wire [4:0] cmd_mux;
wire [31:0] ALU_mux;
wire [31:0] DATA_mux;
wire [31:0] ALU_result;
wire zero;
wire branch;

cpu_complete UUT(
    .clk(clk),
    .reset(reset),
    .instruction(instruction),
    .regWrite(regWrite),
    .ALUScr(ALUScr),
    .op(op),
    .memWrite(memWrite),
    .memRead(memRead),
    .memtoReg(memtoReg),
    .RegDst(RegDst),
    .branch(branch),
    .pc(pc),
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
    reset = 1'b1;   #10;
    reset = 1'b0;   #1600;
    $finish;
end
endmodule
