`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:37 11/13/2014 
// Design Name: 
// Module Name:    testBenchComplete 
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
module testBenchComplete( clk , seg , an , dp , rst , str , stp );

	input clk , rst , str , stp;
	
	output[6:0] seg;
	output[3:0] an;
	output dp;
	
	wire[3:0] oneTenth , oneSec , tenSec , oneMin;
	wire newClk, q , notq;
	
	
	testBench fsm ( oneMin , tenSec , oneSec , oneTenth , 1'b1 , 1'b0 , 1'b1 , 1'b0 , clk , 0 , seg , an , , , dp ); //testBench( input0,input1,input2,input3,dp0_in , dp1_in , dp2_in , dp3_in , clk_in , reset_in , seg_out , an_out , zero_out , tp_out , dp_out);
	
	
	counterBlock counter ( 1'b1 , rst , newClk , oneMin , tenSec , oneSec , oneTenth ); //counterBlock( INinc , INrst , INclk , OUToneMin , OUTtenSec , OUToneSec , OUToneTenth );
	
	
	SRlatch latch ( q , notq , str , stp ); //SRlatch (OUTq, OUTqnot, INset, INreset);
	
	
	prog_timer timer ( clk , 0'b0 , q , 24'd4999999 , , newClk , ); // prog_timer (clk, reset, clken, load_number, counter, zero, tp);  
													  // prog_timer (clk_in,1'b0,1'b1,24'd250000, ,zero_out,tp_out);
	
endmodule
