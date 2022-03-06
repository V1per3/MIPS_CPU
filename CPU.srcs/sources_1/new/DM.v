`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:48:15
// Design Name: 
// Module Name: DM
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


module DM(input [31:0] addr, input [31:0] wd, input we,input clk,output reg [31:0] rd) ;
	reg [7:0] memory[0:255];
	always @(posedge clk) begin
		if(we == 1) begin
			memory[addr] <= wd[31:24];
			memory[addr+1] <= wd[23:16];
			memory[addr+2] <= wd[15:8];
			memory[addr+3] <= wd[7:0];
			rd <= wd;
		end
		else begin
			rd <= {memory[addr], memory[addr+1], memory[addr+2], memory[addr+3]} ;
		end
	end
endmodule
