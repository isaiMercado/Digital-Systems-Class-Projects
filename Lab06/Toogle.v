`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:23 10/15/2014 
// Design Name: 
// Module Name:    Toogle 
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
module Toogle(GCLK, CLR, Qout, Clk_out);
	input GCLK, CLR;
	output Qout, Clk_out;
	wire n;

//FF_DC(q, clk, clr, d); input clk, clr, d; output reg q;
	FF_DC hi (Qout,GCLK,CLR,n);
	not(n,Qout);
	buf(Clk_out,GCLK);
			 
endmodule


