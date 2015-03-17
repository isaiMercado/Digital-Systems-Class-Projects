`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:39 10/08/2014 
// Design Name: 
// Module Name:    ALU1bit 
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
module ALU1bit(Result,Cout,A,B,Cin,Sel1,Sel2);
	input A,B,Cin,Sel1,Sel2;
	output Result,Cout;
	wire Sum,Aout,AandB,notA,CarryOut;
	
	CarryControl CC(Sel1,Sel2,CarryOut,Cout); //module CarryControl(Sel1,Sel2,Cin,Cout);
	FullAdder FA(A,B,Cin,CarryOut,Sum); //module FullAdder(A,B,Cin,Cout,Sum);
	OtherLogic OL(Aout,AandB,notA,A,B); //module OtherLogic(Aout,AandB,notA,A,B);
	Mux4to1 FO(Result,Aout,Sum,AandB,notA,Sel1,Sel2); //module Mux4to1(Out,A,B,C,D,Sel1,Sel2);
endmodule
