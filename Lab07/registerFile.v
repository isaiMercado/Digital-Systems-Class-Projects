`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:01 10/29/2014 
// Design Name: 
// Module Name:    registerFile 
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
module registerFile(sel,clk,clr,w,write,q0,q1,q2,q3);
	
	input[1:0] sel;
	input[3:0] w;
	input clk,clr,write;
	output[3:0] q0,q1,q2,q3;
	wire[3:0] we,f;
	//decoder2to4(control,f);
	//bit4register(q, clk, clr,din,write);
	decoder2to4 dec (sel,f);
	
	assign we[0] = (f[0] == 1 && write)? 1 : 0;
	assign we[1] = (f[1] == 1 && write)? 1 : 0;
	assign we[2] = (f[2] == 1 && write)? 1 : 0;
	assign we[3] = (f[3] == 1 && write)? 1 : 0;
	
	bit4register reg1 (q0, clk, clr,w,we[0]);
	bit4register reg2 (q1, clk, clr,w,we[1]);
	bit4register reg3 (q2, clk, clr,w,we[2]);
	bit4register reg4 (q3, clk, clr,w,we[3]);
	
endmodule
