`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:46:52
// Design Name: 
// Module Name: CPU
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


module CPU(input clk,input reset,input [31:0] instr,input [31:0] readdata,
output [31:0] aluout,output [31:0] pc,output [31:0] writedata,output memwrite);
	wire zf;
	wire [2:0] alucontrol;
	wire alusrc;
	wire jump;
	wire memtoreg;
	wire pcsrc;
	wire regdst;
	wire regwrite;
	Datapath datapath(.alucontrol(alucontrol), .alusrc(alusrc), .clk(clk), .instr(instr), .jump(jump), .memtoreg(memtoreg), .pcsrc(pcsrc), 
				  .readdata (readdata), .regdst(regdst), .regwrite(regwrite), .reset(reset), .aluout(aluout), .pc(pc), .writedata(writedata), .zero(zf));
	Controler controler(.funct(instr[5:0]), .op(instr[31:26]), .zero(zf), .aluct(alucontrol), .alusrc(alusrc), .jump(jump),
				  .memtoreg(memtoreg), .memwrite(memwrite), .pcsrc(pcsrc), .regdst(regdst), .regwrite(regwrite));
endmodule
