`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:34:51
// Design Name: 
// Module Name: Contraler
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


module Controler(
input [5:0] funct,input [5:0] op,input zero,
output [2:0] aluct,output alusrc,output jump,
output memtoreg,output memwrite,output pcsrc,output regdst,output regwrite) ;
	wire [1:0] aluop;
	wire branch;
	ALUdec aludecoder(funct,aluop,aluct) ;
	MAINdec maindecoder(op,regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop) ;
	assign pcsrc=branch & zero;
endmodule