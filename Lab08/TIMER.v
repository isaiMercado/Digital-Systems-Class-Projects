`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:44 11/05/2014 
// Design Name: 
// Module Name:    TIMER 
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
module TIMER(clk_in,rst_in,zero_out,tp_out);
	input clk_in,rst_in;
	output zero_out,tp_out;
	
	prog_timer timer(clk_in,rst_in,1'b1,24'd250000, ,zero_out,tp_out); 

endmodule
