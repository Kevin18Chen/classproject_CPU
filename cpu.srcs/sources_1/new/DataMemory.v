`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:35:42
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input clk,
    input memWrite,
    input memRead,
    input [31:0] address,
    input [31:0] data,
    output reg [31:0] read_data
);
    reg [31:0] memory [0:255];
    
    integer i;
    initial begin
        for(i = 0;i < 32; i = i + 1)   begin
            memory[i] = 0;
        end
    end
    
    always @(negedge clk) begin
        if (memWrite)
            memory[address[7:0]] <= data;
        if (memRead)
            read_data <= memory[address[7:0]];
    end
endmodule
