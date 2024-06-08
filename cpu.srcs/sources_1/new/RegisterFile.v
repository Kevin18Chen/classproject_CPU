`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:22:43
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input clk,
    input regWrite,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
);
    reg [31:0] regs [31:0];
    
    integer i;
    initial begin
        for(i = 0;i < 32; i = i + 1)   begin
            regs[i] = 0;
        end
    end
    
    always @(posedge clk) begin
        if (regWrite)
            regs[write_reg] <= write_data;
    end

    assign read_data1 = regs[read_reg1];
    assign read_data2 = regs[read_reg2];
endmodule
