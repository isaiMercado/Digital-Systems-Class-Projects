`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:45 11/19/2014 
// Design Name: 
// Module Name:    MARMux 
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
module MARMux(
	input[7:0] IR,
	input selMAR,
	input[15:0] eabOut,
	output[15:0] MARMuxOut
    );

	wire[15:0] zext;
	
	assign zext = {{8{0}},IR[7:0]};
	
	assign MARMuxOut = (selMAR == 1'b1) ? zext : eabOut ;
	
endmodule
