`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:00 11/12/2014 
// Design Name: 
// Module Name:    Latch 
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
module SRlatch (OUTq, OUTqnot, INset, INreset);
output OUTq, OUTqnot;
input INset, INreset;
nor(OUTq, OUTqnot, INreset);
nor(OUTqnot, OUTq, INset);
endmodule
