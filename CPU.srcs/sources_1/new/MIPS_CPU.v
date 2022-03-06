`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:49:08
// Design Name: 
// Module Name: MIPS_CPU
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


module MIPS_CPU(input clk,input reset,
output [31:0] dataaddr,output [31:0] writedata,output memwrite,output [31:0] ird,output [31:0] pc);
	wire [31:0] drd;
	wire alusrc;
	wire jump;
	wire memtoreg;
	wire pcsrc;
	wire regdst;
	wire regwrite;
	DM dm(.addr(dataaddr), .wd(writedata), .we(memwrite), .clk(clk), .rd(drd));
	IM im(.pc(pc), .rd(ird)) ;
	CPU cpu(.clk(clk), .instr(ird), .readdata(drd), .reset(reset), .aluout(dataaddr), .memwrite(memwrite), .pc(pc), .writedata(writedata));
endmodule