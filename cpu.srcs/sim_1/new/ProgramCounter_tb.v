`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:06:53
// Design Name: 
// Module Name: ProgramCounter_tb
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


module ProgramCounter_tb();
reg clk = 0;
reg reset;
reg [31:0] next_pc;
wire [31:0] pc;

ProgramCounter UUT(
    .clk(clk),
    .reset(reset),
    .next_pc(next_pc),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin
    reset = 1'b1;   #10;
    reset = 1'b0;
    repeat(16)  begin
        next_pc = {$random};  #10;
    end
    $finish;
end
endmodule
