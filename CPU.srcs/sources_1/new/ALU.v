`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:36:17
// Design Name: 
// Module Name: ALU
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


module ALU(input [2:0] aluct,input [31:0] srca,input [31:0] srcb,
output reg [31:0] aluout,output zero) ;
	always @(*)
	case(aluct)
		3'b000 :aluout = srca+srcb; // add
		3'b001 :aluout = srca*srcb; // mul
		3'b010 :aluout = srca-srcb; // sub
		3'b011 :aluout = srca/srcb; // div
		3'b100 :aluout = srca&srcb; // and
		3'b101 :aluout = srca|srcb; // or
		3'b110 :aluout = srca^srcb; // xor
		3'b111 :aluout = (srca<srcb)?1'b1:0; // SLT
		default:aluout=32'hxxxxxxxx;
	endcase	
	assign zero = (aluout == 0)?1:0;
endmodule
