`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:10 10/08/2014 
// Design Name: 
// Module Name:    CarryControl 
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
module CarryControl(Sel1,Sel2,Cin,Cout);
	input Sel1,Sel2,Cin;
	output Cout;
	
	assign Cout = (Sel1 == 0 && Sel2 == 1)? Cin : 
						1'b0;
endmodule
