`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:44 10/08/2014 
// Design Name: 
// Module Name:    ALU4bits 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU4bits(A,B,Cin,Cout,Result,Sel1,Sel2);
	input[3:0] A;
	input[3:0] B;
	input Cin,Sel1,Sel2;
	output Cout;
	output[3:0] Result;
	wire[2:0] C;
	//assign Cin = 0;
	ALU1bit a1(Result[0],C[0],A[0],B[0],Cin,Sel1,Sel2);//module ALU1bit(Result,Cout,A,B,Cin,Sel1,Sel2);
	ALU1bit a2(Result[1],C[1],A[1],B[1],C[0],Sel1,Sel2);
	ALU1bit a3(Result[2],C[2],A[2],B[2],C[1],Sel1,Sel2);
	ALU1bit a4(Result[3],Cout,A[3],B[3],C[2],Sel1,Sel2);
endmodule
