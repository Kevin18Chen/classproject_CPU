`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:14:33
// Design Name: 
// Module Name: InstructionMemory_tb
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


module InstructionMemory_tb();
reg [31:0] address;
wire [31:0] instruction;

InstructionMemory UUT(
    .address(address),
    .instruction(instruction)
);

initial begin
    repeat(16)  begin
        address = {$random} % 256;  #10;
    end
    $finish;
end
endmodule
