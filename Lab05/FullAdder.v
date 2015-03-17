`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:40 10/08/2014 
// Design Name: 
// Module Name:    FullAdder 
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
module FullAdder(A,B,Cin,Cout,Sum);
	input A,B,Cin;
	output Cout,Sum;
	wire c0,c1,c2;
	
	xor(Sum, A,B,Cin);
	and(c0,A,B);
	and(c1,A,Cin);
	and(c2,B,Cin);
	or(Cout,c0,c1,c2);
	
endmodule
