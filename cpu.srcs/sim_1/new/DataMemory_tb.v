`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:36:05
// Design Name: 
// Module Name: DataMemory_tb
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


module DataMemory_tb();
reg clk = 0;
reg memWrite;
reg memRead;
reg [31:0] address;
reg [31:0] data;
wire [31:0] read_data;

DataMemory UUT(
    .clk(clk),
    .memWrite(memWrite),
    .memRead(memRead),
    .address(address),
    .data(data),
    .read_data(read_data)
);

integer i = 0;

always #5 clk = ~clk;

initial begin
    memWrite = 1'b0;memRead = 1'b0;
    address = 32'b0;data = 32'b0;   #10;
    repeat(32)  begin
        memRead = 1'b0;
        address = i << 2;
        data = i;                       #5;
        memRead = 1'b1;
        i = i + 1;                      #5;
    end
    i = 0;
    memWrite = 1'b0;memRead = 1'b0;
    repeat(32)  begin
        memWrite = 1'b0;
        address = i << 2;
        data = i;                       #5;
        memWrite = 1'b1;
        i = i + 1;                      #5;
    end
    i = 0;
    memWrite = 1'b0;memRead = 1'b0;
    repeat(32)  begin
        memRead = 1'b0;
        address = i << 2;
        data = i;                       #5;
        memRead = 1'b1;
        i = i + 1;                      #5;
    end
    $finish;
end
endmodule
