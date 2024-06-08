`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 22:23:06
// Design Name: 
// Module Name: RegisterFile_tb
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


module RegisterFile_tb();
reg clk = 0;
reg regWrite;
reg [4:0] read_reg1;
reg [4:0] read_reg2;
reg [4:0] write_reg;
reg [31:0] write_data;
wire [31:0] read_data1;
wire [31:0] read_data2;

RegisterFile UUT(
    .clk(clk),
    .regWrite(regWrite),
    .read_reg1(read_reg1),
    .read_reg2(read_reg2),
    .write_reg(write_reg),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

integer i = 0;

always #5 clk = ~clk;

initial begin
    regWrite = 1'b0;write_reg = 5'b0;write_data = 32'b0;
    read_reg1 = 5'b0;read_reg2 = 5'b0;                      #10;
    repeat(32)  begin
        read_reg1 = i;
        read_reg2 = i;  #10;
        i = i + 1;      
    end
    i = 0;
    repeat(32)  begin
        regWrite = 1'b0;
        write_reg = i;
        write_data = i; #5;
        regWrite = 1'b1;
        read_reg1 = 0;
        read_reg2 = 1;  
        i = i + 1;      #5;
    end
    i = 0;
    repeat(32)  begin
        read_reg1 = i;
        read_reg2 = i;  #10;
        i = i + 1;      
    end
    $finish;
end
endmodule
