`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:06 11/19/2014 
// Design Name: 
// Module Name:    NZP 
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
module NZP(
	input clk,reset,flagWE,
	output[15:0] Buss,
	output N,Z,P
    );
	wire wN,wZ,wP;

	assign wN = (Buss[15] == 1'd1)      ? 1'd1 : 1'd0 ;
	assign wZ = (Buss[15:0] == 16'd0)   ? 1'd1 : 1'd0 ; 
	assign wP = (Buss[15] != 1'd1 && Buss[15:0] != 16'd0)? 1'd1 : 1'd0 ;
	
	FF_DCE ff0 (N,clk,wN,reset,flagWE);
	FF_DCE ff1 (Z,clk,wZ,reset,flagWE);
	FF_DCE ff2 (P,clk,wP,reset,flagWE);
	
endmodule


module FF_DCE(q, clk, d, clr, en);
input clk, clr, en, d;
output reg q;
always @(posedge clk)
if (clr) q <= 0;
else if (en)  q <= d;
endmodule


