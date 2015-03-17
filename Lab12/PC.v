`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:14:07 11/19/2014 
// Design Name: 
// Module Name:    PC 
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
module PC(
	input[15:0] Buss, eabOut,
	input[1:0] selPC,
	input ldPC, clk, reset,
	output[15:0] PC
    );
	
	wire[15:0] muxOut;
	
	assign muxOut = (selPC == 2'b00) ? PC + 1 :
						 (selPC == 2'b01) ? eabOut:
						 (selPC == 2'b10) ? Buss : 16'd0 ;
	
	register rg (PC, clk, muxOut, reset, ldPC);

endmodule


module register(dout, clk, din, reset, load);

input clk, reset, load;
input [15:0] din;
output reg [15:0] dout;

always @(posedge clk)
 if (reset) dout <= 16'd0;
else if (load) dout <= din;
endmodule