`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:35:12
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] in_1,
    input [31:0] in_2,
    input [3:0] control,
    output reg [31:0] result,
    output zero
);
    always @(*) begin
        case (control)
            4'b0000: result = in_1;
            4'b0001: result = in_2;             //data write or read
            4'b0010: result = in_1 + in_2;      // Addition
            4'b0110: result = in_1 - in_2;      // Subtraction
            4'b1100: result = !(in_1 > in_2);
            4'b1101: result = !(in_1 == in_2);
            4'b1110: result = !(in_1 < in_2);
            4'b1111: result = 32'b0;            //use to jump
            // Additional operations can be defined here.
            default: result = 0;
        endcase
    end
    assign zero = (result == 0);
endmodule

