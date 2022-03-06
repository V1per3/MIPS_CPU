`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:44:06
// Design Name: 
// Module Name: Datapath
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


module Datapath(
input [2:0] alucontrol,input alusrc,input clk,input jump,input memtoreg,input pcsrc,input regdst,input regwrite,input reset,input [31:0] instr,input [31:0] readdata,
output [31:0] aluout,output [31:0] pc,output [31:0] writedata,output zero);
	wire [31:0] exty;
	wire [31:0] srcbmuxy;
	wire [31:0] immshy;
	wire [31:0] pcadd1y;
	wire [31:0] pcadd2y;
	wire [31:0] pcbmuxy;
	wire [31:0] pcmuxy;
	wire [31:0] rd1;
	wire [31:0] resmuxy;
	wire [4:0]  wrmuxy;
	wire pcadd1c,pcadd2c;
	Signext signext(.imme(instr[15:0]), .unsig(1'b0), .ext(exty)) ;
	add_32bit pcadd1(.A(pc), .B(32'h00000004), .C_1(0), .S(pcadd1y), .C31(pcadd1c));
	Shl2 immsh(.ra(exty), .pa(immshy) ) ;
	add_32bit pcadd2(.A(pcadd1y) ,.B(immshy), .C_1(0), .S(pcadd2y), .C31(pcadd2c));
	Mux pcbmux(.d0(pcadd1y), .d1 (pcadd2y), .s(pcsrc), .y(pcbmuxy)) ;
	Mux resmux(.d0(aluout), .d1(readdata), .s(memtoreg), .y(resmuxy)) ;
	Mux_5 wrmux(.d0(instr[20:16]), .d1(instr[15:11]), .s(regdst) ,.y(wrmuxy)) ;
	Regfile rf(.clk(clk), .we3(regwrite), .ra1(instr[25:21]), .ra2(instr[20:16]), .wa3(wrmuxy), .wd3(resmuxy), .rd1(rd1), .rd2(writedata));
	Mux pcmux(.d0(pcbmuxy), .d1({pc[31:28], instr[25:0], 2'b00}), .s(jump), .y(pcmuxy));
	Mux srcbmux(.d0(writedata), .d1(exty), .s(alusrc), .y(srcbmuxy));
	Pcreg PC(.clk(clk), .d(pcmuxy), .reset(reset), .q(pc));
	ALU alu(.aluct(alucontrol), .srca(rd1), .srcb(srcbmuxy), .aluout(aluout), .zero(zero)) ;
endmodule

