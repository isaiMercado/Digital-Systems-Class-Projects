`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:06 10/29/2014 
// Design Name: 
// Module Name:    flipFlop 
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
module flipFlop(q, clk, d, clr);
	input clk, clr, d;
	output reg q;
	always @(negedge clk)
	if (clr) q <= 0;
	else q <= d;
endmodule

