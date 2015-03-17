`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:00 11/19/2014 
// Design Name: 
// Module Name:    IR 
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
module IR(IR, clk, Buss, reset, ldIR);

input clk, reset, ldIR;
input [15:0] Buss;
output reg [15:0] IR;

always @(posedge clk)
 if (reset) IR <= 16'd0;
else if (ldIR) IR <= Buss;
endmodule
