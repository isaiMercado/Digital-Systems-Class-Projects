`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:59 12/04/2014 
// Design Name: 
// Module Name:    CPU 
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
module CPU(input clk,input reset,input[1:0] aluControl,input enaALU,input[2:0] SR1,input[2:0] SR2,
input[2:0] DR,input regWE,input[1:0] selPC,input enaMARM,input selMAR,input selEAB1,
input[1:0] selEAB2,input enaPC,input ldPC,input ldIR,input ldMAR,input ldMDR,input selMDR,
input memWE,input flagWE,input enaMDR,output N,output Z,output P,output[15:0] IR);

/*
dataPath( input clk,input reset,input[1:0] aluControl,input enaALU,input[2:0] SR1,input[2:0] SR2,
input[2:0] DR,input regWE,input[1:0] selPC,input enaMARM,input selMAR,input selEAB1,
input[1:0] selEAB2,input enaPC,input ldPC,input ldIR,input ldMAR,input ldMDR,input selMDR,
input memWE,input flagWE,input enaMDR,output N,output Z,output P,output[15:0] IR);
*/
dataPath path (clk,  reset,  aluControl,  enaALU,  SR1,  SR2,
  DR,  regWE,  selPC,  enaMARM,  selMAR,  selEAB1,
  selEAB2,  enaPC,  ldPC,  ldIR,  ldMAR,  ldMDR,  selMDR,
  memWE,  flagWE,  enaMDR,  N,  Z,  P,  IR); 

Control control (clk,  reset,  aluControl,  enaALU,  SR1,  SR2,
  DR,  regWE,  selPC,  enaMARM,  selMAR,  selEAB1,
  selEAB2,  enaPC,  ldPC,  ldIR,  ldMAR,  ldMDR,  selMDR,
  memWE,  flagWE,  enaMDR,  N,  Z,  P,  IR);


endmodule
