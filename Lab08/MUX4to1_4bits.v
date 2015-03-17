`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:28 11/05/2014 
// Design Name: 
// Module Name:    MUX4to1_4bits 
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
module MUX4to1_4bits(input0,input1,input2,input3,output0,control);
	input[3:0] input0,input1,input2,input3;
	output[3:0] output0;
	input[1:0] control;
	
	assign output0 = (control == 2'b00)? input0 :
						  (control == 2'b01)? input1 :
						  (control == 2'b10)? input2 : input3;

endmodule
