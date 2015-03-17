`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:38:46 11/03/2014 
// Design Name: 
// Module Name:    testBench 
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
//fourWordFourBitFile(in, out, writeAddress, readAddress, clk, clr, write);
module testBench(in, out, writeAddress, readAddress, clk, clr, write,led);
	input[3:0] in;
	output[3:0] out, led;
	input[1:0] writeAddress;
	input[1:0] readAddress;
	input clk, clr, write;
	
	assign led[0] = in[0];
	assign led[1] = in[1];
	assign led[2] = in[2];
	assign led[3] = in[3];
	
	fourWordFourBitFile file(in, out, writeAddress, readAddress, clk, clr, write);
	
endmodule
