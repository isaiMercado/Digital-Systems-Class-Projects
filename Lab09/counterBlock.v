`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:42 11/12/2014 
// Design Name: 
// Module Name:    counterBlock 
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
module counterBlock(INinc,INrst,INclk,OUToneMin,OUTtenSec,OUToneSec,OUToneTenth);
	
	input INinc,INrst,INclk;
	output[3:0] OUToneMin,OUTtenSec,OUToneSec,OUToneTenth;
	wire[2:0] modOut;
	wire a,b,c;
	
	
	MOD10 tenths (INinc,INrst,INclk,OUToneTenth); //MOD10(inc,rst,clk,curS);
	assign a = (OUToneTenth == 4'b1001)? 1'b1 : 1'b0;
	
	
	MOD10	oneSec (a,INrst,INclk,OUToneSec);
	assign b = (OUToneSec == 4'b1001 && a == 1'b1)? 1'b1 : 1'b0;
	
	
	MOD6	tenSec (b,INrst,INclk,modOut);
	assign OUTtenSec = {1'b0,modOut};
	assign c = (modOut == 3'b110 && b == 1'b1)? 1'b1 : 1'b0;
	
	
	MOD10 oneMin (c,INrst,INclk,OUToneMin);
	
endmodule
