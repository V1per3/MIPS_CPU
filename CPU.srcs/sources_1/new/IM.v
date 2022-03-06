`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:48:05
// Design Name: 
// Module Name: IM
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


module IM(input [31:0] pc,output [31:0] rd) ;
	reg [7:0] mem[0:255];
	reg [31:0] instruction;
	initial
	begin
		$readmemh("E:/Vivado/CPU/instruction.dat", mem);
		instruction = 0;
	end
	always @(pc) begin
		instruction = {mem[pc], mem[pc+1], mem[pc+2], mem[pc+3]} ;
	end
	assign rd = instruction;
endmodule
