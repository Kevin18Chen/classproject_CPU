`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 16:00:19
// Design Name: 
// Module Name: cpu_ctrl_tb
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


module cpu_ctrl_tb();
reg clk = 0;
reg [31:0] instruction;

wire regWrite;
wire ALUScr;
wire [3:0] op;
wire memWrite;
wire memRead;
wire memtoReg;
wire RegDst;

wire [31:0] read_data1;
wire [31:0] read_data2;
wire [31:0] read_data;
wire [4:0] cmd_mux;
wire [31:0] ALU_mux;
wire [31:0] DATA_mux;
wire [31:0] ALU_result;
wire zero;

cpu_ctrl UUT(
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
    instruction = 32'b010000_00000_00000_00000_00000000010;  #10;
    instruction = 32'b010000_00000_00001_00000_00000000101;  #10;
    instruction = 32'b010000_00000_00010_00000_00000001001;  #10;
    instruction = 32'b010000_00000_00011_00000_00000001011;  #10;
    instruction = 32'b010001_00000_00001_00000_00000000000;  #10;
    instruction = 32'b010001_00010_00011_00000_00000000000;  #10;
    instruction = 32'b010010_00000_00001_00000_00000000000;  #10;
    instruction = 32'b010011_00000_00000_00000_00000000000;  #10;
    instruction = 32'b010010_00000_00010_00000_00000000001;  #10;
    instruction = 32'b010011_00000_00000_00000_00000000001;  #10;
    instruction = 32'b010100_00000_00100_00000_00000000000;  #10;
    instruction = 32'b010100_00000_00101_00000_00000000001;  #10;
    instruction = 32'b010001_00100_00101_00000_00000000000;  #10;
    instruction = 32'b000000_00100_00101_00110_00000000000;  #10;
    instruction = 32'b010010_00000_00110_00000_00000000010;  #10;
    instruction = 32'b010011_00000_00000_00000_00000000010;  #10
    $finish;
end
endmodule
