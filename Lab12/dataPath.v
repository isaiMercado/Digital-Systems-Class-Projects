`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:37 12/03/2014 
// Design Name: 
// Module Name:    dataPath 
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
//`default_nettype none
module dataPath( input clk,input reset,input[1:0] aluControl,input enaALU,input[2:0] SR1,input[2:0] SR2,
input[2:0] DR,input regWE,input[1:0] selPC,input enaMARM,input selMAR,input selEAB1,
input[1:0] selEAB2,input enaPC,input ldPC,input ldIR,input ldMAR,input ldMDR,input selMDR,
input memWE,input flagWE,input enaMDR,output N,output Z,output P,output[15:0] IR);

wire[15:0] Ra,  Rb,  aluOut,  Buss,  eabOut,  MARMuxOut,  mdrOut,  PC;


ALU alu (Ra,  Rb,  IR[5:0],  aluControl,  aluOut); //ALU(input[15:0] Ra,Rb,input[5:0] IR,input[1:0] aluControl,output[15:0] aluOut);
ts_driver EnaALU (aluOut,  Buss,  enaALU);


IR ir (IR,  clk,  Buss,  reset,  ldIR); //IR(output[15:0] IR,  input clk,  input[15:0] Buss,  input reset,  input ldIR);  

           
MARMux marmx (IR[7:0],  selMAR,  eabOut,  MARMuxOut); //module MARMux(input[7:0] IR,input selMAR,input[15:0] eabOut,output[15:0] MARMuxOut);
ts_driver EnaMARM (MARMuxOut,  Buss,  enaMARM);


Memory memory (mdrOut,  Buss,  clk,  reset,  ldMAR,  ldMDR,  selMDR,  memWE); //Memory(mdrOut, Buss, clk, reset, ldMAR, ldMDR, selMDR, memWE);
ts_driver EnaMDR (mdrOut,  Buss,  enaMDR);

NZP nzp (clk,  reset,  flagWE,  Buss,  N,  Z,  P); //module NZP(input clk,reset,flagWE,output[15:0] Buss,output N,Z,P);


PC pc (Buss,  eabOut,  selPC,  ldPC,  clk,  reset,  PC); //PC(input[15:0] Buss, eabOut,input[1:0] selPC,input ldPC, clk, reset,output[15:0] PC);
ts_driver EnaPC (PC,  Buss,  enaPC);


RegFile regfile(Buss,  DR,  SR1,  SR2,  regWE,  clk,  reset,  Rb,  Ra); //module RegFile(input[15:0] Buss,input[2:0] DR, SR1, SR2,input regWE, clk, reset,output[15:0] Rb, Ra);

EAB eab (PC,  Ra,  IR[10:0],  selEAB2,  selEAB1,  eabOut); //EAB(input[15:0] PC, Ra,input[10:0] IR,input[1:0] selEAB2,input selEAB1,output[15:0] eabOut);

endmodule

