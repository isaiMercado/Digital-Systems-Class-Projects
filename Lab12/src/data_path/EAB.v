`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:10 11/19/2014 
// Design Name: 
// Module Name:    EAB 
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
module EAB(
	input[15:0] PC, Ra,
	input[10:0] IR,
	input[1:0] selEAB2,
	input selEAB1,
	output[15:0] eabOut
    );
	 
	wire[15:0] sext11,sext9,sext6,bigMuxOut,smallMuxOut;

	assign sext11 = {{5{IR[10]}},IR[10:0]};
	assign sext9  = {{7{IR[8]}},IR[8:0]};
	assign sext6  = {{10{IR[5]}},IR[5:0]};
	
	assign bigMuxOut = (selEAB2 == 2'b00)? 16'd0 : 
							 (selEAB2 == 2'b01)? sext6 : 
							 (selEAB2 == 2'b10)? sext9 : sext11;
							 
	assign smallMuxOut = (selEAB1 == 1'b0)? PC : Ra;
							 
	assign eabOut = bigMuxOut + smallMuxOut; 
	
endmodule
