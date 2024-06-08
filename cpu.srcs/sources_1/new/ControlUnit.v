`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/03 15:33:11
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(       
    input [5:0] opcode,
    output reg regDst,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg [3:0] aluOp,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite
    );

always @(opcode)    begin
    regDst = 0; memRead = 0; memToReg = 0;
    aluOp = 4'b0000; memWrite = 0; aluSrc = 0; regWrite = 0; branch = 0;
    case(opcode)
            6'b000000: begin // add cmd:000000_address1-data_address2 -data_write-address_X
                aluSrc = 0;memToReg = 0;regDst = 1;
                regWrite = 1;memWrite = 0;memRead = 0;
                aluOp = 4'b0010;branch = 0;
            end
            6'b000001: begin // sub cmd:000001_address1-data_address2 -data_write-address_X
                aluSrc = 0;memToReg = 0;regDst = 1;
                regWrite = 1;memWrite = 0;memRead = 0;
                aluOp = 4'b0110;branch = 0;
            end
            6'b000010: begin // addi cmd:000000_address-data_write-address_number[15:0]
                aluSrc = 1;memToReg = 0;regDst = 0;
                regWrite = 1;memWrite = 0;memRead = 0;
                aluOp = 4'b0010;branch = 0;
            end
            6'b000100: begin // BGE cmd:000100_address1-data_address2-data_jump-address[15:0]
                regDst = 0;aluSrc = 0;memToReg = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b1100;branch = 1;
            end
            6'b000101: begin // BEQ cmd:000101_address1-data_address2-data_jump-address[15:0]
                regDst = 0;aluSrc = 0;memToReg = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b1101;branch = 1;
            end
            6'b000110: begin // BLE cmd:000110_address1-data_address2-data_jump-address[15:0]
                regDst = 0;aluSrc = 0;memToReg = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b1110;branch = 1;
            end
            6'b000111: begin //jump cmd:000111_X_X_jump-address[15:0]
                aluSrc = 0;memToReg = 0;regDst = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b1111;branch = 1;
            end
            6'b001001: begin // li cmd:001001_X_address_data[15;0]
                aluSrc = 1;memToReg = 0;regDst = 0;
                regWrite = 1;memWrite = 0;memRead = 0;
                aluOp = 4'b0001;branch = 0;
            end
            6'b100011: begin // lw cmd:100011_X_address reg[20:16]_address mem[15:0]
                aluSrc = 1;memToReg = 1;regDst = 0;
                regWrite = 1;memWrite = 0;memRead = 1;
                aluOp = 4'b0001;branch = 0;
            end
            6'b101011: begin // sw cmd:101011_X_address reg[20:16]_address mem[15:0]
                aluSrc = 1;memToReg = 0;regDst = 0;
                regWrite = 0;memWrite = 1;memRead = 0;
                aluOp = 4'b0001;branch = 0;
            end
            6'b010001: begin // mv cmd:000101_X_address reg[20:16]_address mem[15:11]_X
                aluSrc = 0;memToReg = 0;regDst = 1;
                regWrite = 1;memWrite = 0;memRead = 0;
                aluOp = 4'b0001;branch = 0;
            end
            6'b111111: begin // read to reg cmd:010001_address1[25:21]_address2[20:16]_X[15:0]
                aluSrc = 1;memToReg = 0;regDst = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b0001;branch = 0;
            end
            6'b111110: begin // read to mem cmd:010011_X[25:21]_X[20:16]_address mem[15:0]
                aluSrc = 1;memToReg = 0;regDst = 0;
                regWrite = 0;memWrite = 0;memRead = 1;
                aluOp = 4'b0001;branch = 0;
            end
            /*
            6'b100011: begin // LW
                regDst = 0;aluSrc = 1;memToReg = 1;
                regWrite = 1;memWrite = 0;memRead = 1;
                aluOp = 4'b0010;branch = 0;             // ADD for address calculation
            end
            6'b101011: begin // SW
                regDst = 0;aluSrc = 1;memToReg = 0;
                regWrite = 0;memWrite = 1;memRead = 0;
                aluOp = 4'b0010;branch = 0;             // ADD for address calculation
            end
            6'b000100: begin // BEQ
                regDst = 0;aluSrc = 0;memToReg = 0;
                regWrite = 0;memWrite = 0;memRead = 0;
                aluOp = 4'b0110;branch = 1;             // SUBTRACT for comparison
            end
            // Add more cases for different opcodes
            */
    endcase
end
endmodule
