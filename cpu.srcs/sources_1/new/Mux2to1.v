`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:22:17
// Design Name: 
// Module Name: Mux2to1
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


module Mux2to1 #(parameter WIDTH = 32)(
    input [WIDTH-1:0] in_0,
    input [WIDTH-1:0] in_1,
    input s,
    output [WIDTH-1:0] f
);
    assign f = (s ? in_1 : in_0);
endmodule

