`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:01 11/12/2014 
// Design Name: 
// Module Name:    MOD6 
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
module MOD6(inc,rst,clk,curS);
	input inc, rst, clk;
	output[2:0] curS;
	wire[2:0] nxtS;
	
	// next state logic
	//assign nxtS = (curS == 2'd3)? 0 : curS + 2'd1;
	assign nxtS = (inc != 1'd1)? curS : (curS < 3'd5)? curS + 3'd1 : 3'd0;

	
	FF flip0(curS[0],clk,rst,nxtS[0]);
	FF flip1(curS[1],clk,rst,nxtS[1]);
	FF flip2(curS[2],clk,rst,nxtS[2]);
	
endmodule



module FF(q, clk, clr, d);
    input clk, clr, d;
    output reg q;

    always @(posedge clk)
        if (clr) q <= 0;
        else q <= d;
endmodule
