`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:51 11/19/2014 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
	input[15:0] Ra,Rb,
	input[5:0] IR,
	input[1:0] aluControl,
	output[15:0] aluOut
    );
	wire[15:0] partB;
	
	assign partB = (IR[5] == 1'b1)? {{11{IR[4]}},IR[4:0]} : Rb ;

	assign aluOut = (aluControl == 2'b00)? Ra         : 
						 (aluControl == 2'b01)? partB + Ra : 
						 (aluControl == 2'b10)? partB & Ra : ~Ra ;
endmodule
