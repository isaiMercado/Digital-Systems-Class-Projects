`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:46 10/08/2014 
// Design Name: 
// Module Name:    Mux4to1 
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
module Mux4to1(Out,A,B,C,D,Sel1,Sel2);
	input A,B,C,D,Sel1,Sel2;
	output Out;
	
	assign Out = (Sel1 == 0 && Sel2 == 0)? A : 
					 (Sel1 == 0 && Sel2 == 1)? B : 
					 (Sel1 == 1 && Sel2 == 0)? C : 
					 (Sel1 == 1 && Sel2 == 1)? D : 1'b0;

endmodule
