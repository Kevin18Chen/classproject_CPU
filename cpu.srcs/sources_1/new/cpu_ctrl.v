`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 15:52:51
// Design Name: 
// Module Name: cpu_ctrl
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


module cpu_ctrl(
    input clk,
    input [31:0] instruction,
    output regWrite,
    output ALUScr,
    output [3:0] op,
    output memWrite,
    output memRead,
    output memtoReg,
    output RegDst,
    output [31:0] read_data1,
    output [31:0] read_data2,
    output [31:0] read_data,
    output [4:0] cmd_mux,
    output [31:0] ALU_mux,
    output [31:0] DATA_mux,
    output [31:0] ALU_result,
    output zero
);
/*
wire regWrite;
wire ALUScr;
wire [3:0] op;
wire memWrite;
wire memRead;
wire memtoReg;
wire RegDst;
*/
wire [31:0] SE_wire;
wire branch;

RegisterFile RF(
    .clk(clk),
    .regWrite(regWrite),
    .read_reg1(instruction[25:21]),
    .read_reg2(instruction[20:16]),
    .write_reg(cmd_mux),
    .write_data(DATA_mux),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

ALU alu(
    .in_1(read_data1),
    .in_2(ALU_mux),
    .control(op),
    .result(ALU_result),
    .zero(zero)
);

SignExtend SE(
    .data_in(instruction[15:0]),
    .data_out(SE_wire)
);

DataMemory UUT(
    .clk(clk),
    .memWrite(memWrite),
    .memRead(memRead),
    .address(ALU_result),
    .data(read_data2),
    .read_data(read_data)
);

Mux2to1 #(32) mux1(
    .in_0(read_data2),
    .in_1(SE_wire),
    .s(ALUScr),
    .f(ALU_mux)
);

Mux2to1 #(32) mux2(
    .in_0(ALU_result),
    .in_1(read_data),
    .s(memtoReg),
    .f(DATA_mux)
);

Mux2to1 #(5) mux3(
    .in_0(instruction[20:16]),
    .in_1(instruction[15:11]),
    .s(RegDst),
    .f(cmd_mux)
);

ControlUnit ctrl(
    .opcode(instruction[31:26]),
    .regDst(RegDst),
    .branch(branch),
    .memRead(memRead),
    .memToReg(memtoReg),
    .aluOp(op),
    .memWrite(memWrite),
    .aluSrc(ALUScr),
    .regWrite(regWrite)
);
endmodule
