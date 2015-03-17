`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:46 10/08/2014 
// Design Name: 
// Module Name:    OtherLogic 
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
module OtherLogic(Aout,AandB,notA,A,B);
	input A,B;
	output Aout,AandB,notA;
	
	not(notA,A);
	and (AandB,A,B);
	assign Aout = A;
endmodule
