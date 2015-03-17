`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:35 11/12/2014 
// Design Name: 
// Module Name:    MOD10 
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
module MOD10(inc,rst,clk,curS);
	input inc, rst, clk;
	output[3:0] curS;
	wire[3:0] nxtS;
	
	// next state logic
	//assign nxtS = (curS == 2'd3)? 0 : curS + 2'd1;
	assign nxtS = (inc != 1'd1)? curS : (curS < 4'h9)? curS + 4'd1 : 4'd0;

	
	FF flip0(curS[0],clk,rst,nxtS[0]);
	FF flip1(curS[1],clk,rst,nxtS[1]);
	FF flip2(curS[2],clk,rst,nxtS[2]);
	FF flip3(curS[3],clk,rst,nxtS[3]);
	
endmodule



