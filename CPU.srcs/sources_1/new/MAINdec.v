`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:34:03
// Design Name: 
// Module Name: MAINdec
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


module MAINdec(input [5:0] op,
output regwrite,
output regdst,
output alusrc,
output branch,
output memwrite,
output memtoreg,
output jump,
output [1 :0] aluop
);
	reg [8:0] control ;
	assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop}=control;
	always @(*)
		case(op)
		6'b000000:control <= 9'b110000010; //Rtype
		6'b001000:control <= 9'b101000000; // addi
		6'b100011:control <= 9'b101001000; // lw
		6'b101011:control <= 9'b001010000; // sw
		6'b000100:control <= 9'b000100001; // beq
		6'b000010:control <= 9'b000000100; // jump
		default:control <= 9'bxxxxxxxxx ; //illegal operand
	endcase
endmodule
