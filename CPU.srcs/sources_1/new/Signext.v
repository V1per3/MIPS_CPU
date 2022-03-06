`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:43:21
// Design Name: 
// Module Name: Signext
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


module Signext(input [15:0] imme,input unsig,output [31:0] ext);
	assign ext[15:0] = imme;
	assign ext[31:16] = unsig?16'h0000:(imme[15]?16'hffff:16'h0000);
endmodule
