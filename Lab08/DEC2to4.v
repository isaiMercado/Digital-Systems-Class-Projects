`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:37 11/05/2014 
// Design Name: 
// Module Name:    DEC2to4 
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
module DEC2to4(in,out);
	input[1:0] in;
	output[3:0] out;
	
	
	assign out = (in == 2'b00)? 4'b1000 :
					 (in == 2'b01)? 4'b0100 :
					 (in == 2'b10)? 4'b0010 : 4'b0001;
	
	/*				 
	assign out = (in == 2'b00)? 4'b0001 :
					 (in == 2'b01)? 4'b0010 :
					 (in == 2'b10)? 4'b0100 : 4'b1000;
	*/

endmodule
