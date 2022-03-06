`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:37:11
// Design Name: 
// Module Name: Pcreg
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


module Pcreg(input clk, input reset, input [31:0] d, output reg [31:0] q);
	always @(posedge clk)
	begin
		q = d;
		if(reset)
			q= 32'h00000000 ;
	end
endmodule
