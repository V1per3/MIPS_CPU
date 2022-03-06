`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 12:19:11
// Design Name: 
// Module Name: MIPS_simulation
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


module MIPS_simulation;
    reg reset;
    reg clk;
    wire [31:0] dataaddr;
    wire [31:0] writedata;
    wire memwrite;
    wire [31:0] pc;
    wire [31:0] ird;
initial begin
clk = 1'b1;reset = 1'b1;
#10 reset = 1'b0;
//#100 reset = 1'b1;
end
always #10 clk = ~clk;
    MIPS_CPU MIPS_case(clk,reset,dataaddr,writedata,memwrite,ird,pc);
endmodule
