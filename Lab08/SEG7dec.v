`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:19 11/05/2014 
// Design Name: 
// Module Name:    SEG7dec 
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
module SEG7dec(num_in, numCode_out);
	input[3:0] num_in;
	output[6:0] numCode_out;

	assign numCode_out = (num_in == 4'd0)?  7'b0000001 :
								(num_in == 4'd1)?  7'b1001111 :
								(num_in == 4'd2)?  7'b0010010 :
								(num_in == 4'd3)?  7'b0000110 :
								(num_in == 4'd4)?  7'b1001100 :
								(num_in == 4'd5)?  7'b0100100 :
								(num_in == 4'd6)?  7'b0100000 :
								(num_in == 4'd7)?  7'b0001111 :
								(num_in == 4'd8)?  7'b0000000 :
								(num_in == 4'd9)?  7'b0000100 :
								(num_in == 4'd10)? 7'b0001000 :
								(num_in == 4'd11)? 7'b1100000 :
								(num_in == 4'd12)? 7'b0110001 :
								(num_in == 4'd13)? 7'b1000010 :
								(num_in == 4'd14)? 7'b0110000 : 0111000;
endmodule
