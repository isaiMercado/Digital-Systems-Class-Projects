`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:59 11/05/2014 
// Design Name: 
// Module Name:    testBench 
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
module testBench( input0,input1,input2,input3,dp0_in , dp1_in , dp2_in , dp3_in , clk_in , reset_in , seg_out , an_out , zero_out , tp_out , dp_out);
	input dp0_in,dp1_in,dp2_in,dp3_in,clk_in,reset_in;
	input[3:0] input0,input1,input2,input3;
	output[6:0] seg_out;
	output[3:0] an_out;
	output zero_out,tp_out,dp_out;
	wire[1:0] curS_out;
	wire[3:0] mux4bits_out,an_out_wire;
	wire dp_out_wire;
	
	
	prog_timer timer (clk_in,1'b0,1'b1,24'd250000, ,zero_out,tp_out); //prog_timer (clk, reset, clken, load_number, counter, zero, tp); 
	MOD4 mod (zero_out,reset_in,clk_in,curS_out); //MOD4(inc,rst,clk,curS);
	
	DEC2to4 dec (curS_out,an_out_wire); //DEC2to4(in,out);
	MUX4to1_1bit smallMux (dp0_in,dp1_in,dp2_in,dp3_in,dp_out_wire,curS_out); //MUX4to1_1bit(input0,input1,input2,input3,output0,control);
	assign dp_out = ~dp_out_wire;
	assign an_out = ~an_out_wire;
	MUX4to1_4bits bigMux ( input0 , input1 , input2 , input3 ,mux4bits_out,curS_out); //MUX4to1_1bit(input0,input1,input2,input3,output0,control);
	SEG7dec seg (mux4bits_out,seg_out); //SEG7dec(num_in, numCode_out);
	
endmodule
