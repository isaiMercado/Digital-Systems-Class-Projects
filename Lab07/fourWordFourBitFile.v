`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:11 11/03/2014 
// Design Name: 
// Module Name:    fourWordFourBitFile 
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
 module fourWordFourBitFile(in, out, writeAddress, readAddress, clk, clr, write);
	input[3:0] in;
	output[3:0] out;
	input[1:0] writeAddress;
	input[1:0] readAddress;
	input clk, clr, write;
	wire[3:0] input0, input1, input2, input3;
	
		registerFile file(writeAddress, clk,clr,in,write,input0,input1,input2,input3); //registerFile(sel,clk,clr,w,write,q0,q1,q2,q3);
		mux4to1_4bits mux(input0, input1, input2, input3, out, readAddress); //mux4to1_4bits(input0, input1, input2, input3, output0, control);

endmodule
