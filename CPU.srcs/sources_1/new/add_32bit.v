`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/01/15 11:41:04
// Design Name: 
// Module Name: add_32bit
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


module add_32bit(S,C31,A,B,C_1);
    input [31:0] A,B;  //32位加数A,被加数B
    input C_1;         //最低进位C_1
    output [31:0] S;   //32位和
    output C31;        //向最高位的进位信号
    wire C0,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,
          C17,C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30;  //内部进位信号
    fulladder FA0(S[0],C0,A[0],B[0],C_1),
              FA1(S[1],C1,A[1],B[1],C0),
              FA2(S[2],C2,A[2],B[2],C1),
              FA3(S[3],C3,A[3],B[3],C2),
              FA4(S[4],C4,A[4],B[4],C3),
              FA5(S[5],C5,A[5],B[5],C4),
              FA6(S[6],C6,A[6],B[6],C5),
              FA7(S[7],C7,A[7],B[7],C6),
              FA8(S[8],C8,A[8],B[8],C7),
              FA9(S[9],C9,A[9],B[9],C8),
              FA10(S[10],C10,A[10],B[10],C9),
              FA11(S[11],C11,A[11],B[11],C10),
              FA12(S[12],C12,A[12],B[12],C11),
              FA13(S[13],C13,A[13],B[13],C12),
              FA14(S[14],C14,A[14],B[14],C13),
              FA15(S[15],C15,A[15],B[15],C14),
              FA16(S[16],C16,A[16],B[16],C15),
              FA17(S[17],C17,A[17],B[17],C16),
              FA18(S[18],C18,A[18],B[18],C17),
              FA19(S[19],C19,A[19],B[19],C18),
              FA20(S[20],C20,A[20],B[20],C19),
              FA21(S[21],C21,A[21],B[21],C20),
              FA22(S[22],C22,A[22],B[22],C21),
              FA23(S[23],C23,A[23],B[23],C22),
              FA24(S[24],C24,A[24],B[24],C23),
              FA25(S[25],C25,A[25],B[25],C24),
              FA26(S[26],C26,A[26],B[26],C25),
              FA27(S[27],C27,A[27],B[27],C26),
              FA28(S[28],C28,A[28],B[28],C27),
              FA29(S[29],C29,A[29],B[29],C28),
              FA30(S[30],C30,A[30],B[30],C29),
              FA31(S[31],C31,A[31],B[31],C30);
 endmodule
