`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:33:08
// Design Name: 
// Module Name: ALUdec
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


module ALUdec(input [5:0] funct,input [1:0] aluop,output reg [2:0] aluct);
	always @(*)
	case(aluop)
		2'b00:aluct <= 3'b000 ; //add
		2'b01:aluct <= 3'b010; //sub
		default:case(funct)
			6'b100000:aluct <= 3'b000 ; // add
			6'b100010:aluct <= 3'b010 ; // sub
			6'b100001:aluct <= 3'b001 ; // mul
			6'b100011:aluct <= 3'b011 ; // div
			6'b100111:aluct <= 3'b111 ; // slt
			6'b100100:aluct <= 3'b100 ; // and
			6'b100101:aluct <= 3'b101 ; // or
			6'b100110:aluct <= 3'b110; // xor
			default:aluct <= 3'bxxx;
		endcase
	endcase
endmodule
