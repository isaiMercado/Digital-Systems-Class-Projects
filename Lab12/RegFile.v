`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:02 11/19/2014 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
	input[15:0] Buss,
	input[2:0] DR, SR1, SR2,
	input regWE, clk, reset,
	output[15:0] Rb, Ra
    );
	 
	wire[15:0] regOut0,regOut1,regOut2,regOut3,regOut4,regOut5,regOut6,regOut7;
	wire[7:0] writeE;
	 
	assign Ra = (SR1 == 3'd0) ? regOut0 :
					(SR1 == 3'd1) ? regOut1 :
					(SR1 == 3'd2) ? regOut2 :
					(SR1 == 3'd3) ? regOut3 :
					(SR1 == 3'd4) ? regOut4 :
					(SR1 == 3'd5) ? regOut5 :
					(SR1 == 3'd6) ? regOut6 : 
					(SR1 == 3'd7) ? regOut7 : 16'd0 ;
	
	assign Rb = (SR2 == 3'd0) ? regOut0 :
					(SR2 == 3'd1) ? regOut1 :
					(SR2 == 3'd2) ? regOut2 :
					(SR2 == 3'd3) ? regOut3 :
					(SR2 == 3'd4) ? regOut4 :
					(SR2 == 3'd5) ? regOut5 :
					(SR2 == 3'd6) ? regOut6 : 
					(SR2 == 3'd7) ? regOut7 : 16'd0 ;
	
	assign writeE = (regWE == 1'b1) ? 8'b00000001 << DR : 8'd0; 
	
	register r0 (regOut0, clk, Buss, reset, writeE[0]); //(dout, clk, din, reset, load);
	register r1 (regOut1, clk, Buss, reset, writeE[1]);
	register r2 (regOut2, clk, Buss, reset, writeE[2]);
	register r3 (regOut3, clk, Buss, reset, writeE[3]);
	register r4 (regOut4, clk, Buss, reset, writeE[4]);
	register r5 (regOut5, clk, Buss, reset, writeE[5]);
	register r6 (regOut6, clk, Buss, reset, writeE[6]);
	register r7 (regOut7, clk, Buss, reset, writeE[7]);
endmodule
