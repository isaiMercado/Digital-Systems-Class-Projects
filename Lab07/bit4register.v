`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:53 10/29/2014 
// Design Name: 
// Module Name:    bit4register 
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
module bit4register(q, clk, clr,din,write);
	
	input[3:0] din;
	input clk,clr,write;
	output[3:0] q;
	
	bit1register reg1(q[0],clk,clr,din[0],write); //bit1register(q,clk,clr,din,write);
	bit1register reg2(q[1],clk,clr,din[1],write);
	bit1register reg3(q[2],clk,clr,din[2],write);
	bit1register reg4(q[3],clk,clr,din[3],write);
	
endmodule
