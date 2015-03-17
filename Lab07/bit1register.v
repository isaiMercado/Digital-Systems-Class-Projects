`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:41 10/29/2014 
// Design Name: 
// Module Name:    bit1register 
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
module bit1register(q,clk,clr,din,write);

	input clk,clr,din,write;
	output q;
	wire temp;
	
	assign temp = (write)? din:q;
	flipFlop flipflop(q,clk,temp,clr);//module flipFlop(q, clk, d, clr);
	
endmodule
