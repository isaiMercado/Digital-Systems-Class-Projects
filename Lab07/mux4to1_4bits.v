`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:15 11/03/2014 
// Design Name: 
// Module Name:    mux4to1_4bits 
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
module mux4to1_4bits(input0, input1, input2, input3, output0, control);
	input[3:0] input0,input1,input2,input3;
	output[3:0] output0;
	input[1:0] control;

	assign output0 = (control == 0)? input0 : 
						  (control == 1)? input1 : 
						  (control == 2)? input2 : 
						  (control == 3)? input3 : 0;

endmodule
