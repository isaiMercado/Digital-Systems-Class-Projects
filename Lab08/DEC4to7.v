`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:45 11/05/2014 
// Design Name: 
// Module Name:    DEC4to7 
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
module DEC4to7(in,out);
	input[3:0] in;
	output[6:0] out;
	
	assign out = (in == 0)? 0 :
					 (in == 1)? 1 :
					 (in == 2)? 2 :
					 (in == 3)? 3 :
					 (in == 4)? 4 :
					 (in == 5)? 5 :
					 (in == 6)? 6 : 0;
endmodule
