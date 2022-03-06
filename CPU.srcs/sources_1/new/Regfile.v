`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:38:33
// Design Name: 
// Module Name: Regfile
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


module Regfile(
	input we3,input [4:0] ra1,input [4:0] ra2,input [4:0] wa3,input [31:0] wd3,input clk,
	output [31:0] rd1,output [31:0] rd2);
	reg [31:0] rf[0:9];
	always @ (posedge clk)
		if (we3)
			rf[wa3]<=wd3;
	assign rd1=(ra1 !=0)?rf[ra1]:0;
	assign rd2=(ra2 !=0)?rf[ra2]:0;
endmodule
