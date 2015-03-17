`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:38 10/29/2014 
// Design Name: 
// Module Name:    decoder2to4 
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
module decoder2to4(control,f);
	input[1:0] control;
	output[3:0] f;
	
	assign f = 1 << control; 

endmodule
