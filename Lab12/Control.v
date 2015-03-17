`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:28 12/04/2014 
// Design Name: 
// Module Name:    Control 
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
module Control(output clk,output reset,output reg [1:0] aluControl,output reg enaALU,output reg [2:0] SR1,output reg [2:0] SR2,
               output reg [2:0] DR,output reg regWE,output reg [1:0] selPC,output reg enaMARM,output reg selMAR,output reg selEAB1,
               output reg [1:0] selEAB2,output reg enaPC,output reg ldPC,output reg ldIR,output reg ldMAR,output reg ldMDR,output reg selMDR,
               output reg memWE,output reg flagWE,output reg enaMDR,input N,input Z,input P,input[15:0] IR );

	wire JumpEnable;

	parameter Reset = 6'd0;
	parameter Fetch0 = 6'd1;
	parameter Fetch1 = 6'd2;
	parameter Fetch2 = 6'd3;
	parameter Decode = 6'd4;
	parameter Branch0 = 6'd5;
	parameter Branch1 = 6'd6;
	parameter Add = 6'd7;
	parameter Load0 = 6'd8;
	parameter Load1 = 6'd9;
	parameter Load2 = 6'd10;
	parameter Store0 = 6'd11;
	parameter Store1 = 6'd12;
	parameter Store2 = 6'd13;
	parameter JumpToSubroutine = 6'd14;
	parameter JumpToSubroutineOffset = 6'd15;
	parameter JumpToSubroutineBaseR = 6'd16;
	parameter And = 6'd17;
	parameter LoadRelative0 = 6'd18;
	parameter LoadRelative1 = 6'd19;
	parameter LoadRelative2 = 6'd20;
	parameter StoreRelative0 = 6'd21;
	parameter StoreRelative1 = 6'd22;
	parameter StoreRelative2 = 6'd23;
	parameter Not = 6'd24;
	parameter LoadIndirect0 = 6'd25;
	parameter LoadIndirect1 = 6'd26;
	parameter LoadIndirect2 = 6'd27;
	parameter LoadIndirect3 = 6'd28;
	parameter LoadIndirect4 = 6'd29;
	parameter StoreIndirect0 = 6'd30;
	parameter StoreIndirect1 = 6'd31;
	parameter StoreIndirect2 = 6'd32;
	parameter StoreIndirect3 = 6'd33;
	parameter StoreIndirect4 = 6'd34;
	parameter Jump = 6'd35;
	parameter LoadEffectiveAddress = 6'd36;


	
	reg[5:0] CurrentState;
	reg[5:0] NextState;

	always @(posedge clk)
	if (reset) CurrentState <= Fetch0;
	else   CurrentState <= NextState;

	assign JumpEnable = (N == 1'b1 || Z == 1'b1 || P == 1'b1)? 1'b1 : 1'b0; 
	


	
	always @(*)
	begin
	
	 aluControl = 2'b00;
	 enaALU = 1'b0;
	 SR1 = 3'b000;
	 SR2 = 3'b000;
	 DR = 3'b000;
	 regWE = 1'b0;
	 selPC = 2'b00;
	 enaMARM = 1'b0;
	 selMAR = 1'b0;
	 selEAB1 = 1'b0;
	 selEAB2 = 2'b00;
	 enaPC = 1'b0;
	 ldPC = 1'b0;
	 ldIR = 1'b0;
	 ldMAR = 1'b0;
	 ldMDR = 1'b0;
	 selMDR = 1'b0;
	 memWE = 1'b0;
	 flagWE = 1'b0;
	 enaMDR = 1'b0;
	
		
			case (CurrentState)
				 (Fetch0) : begin
						 enaPC = 1'b1;
						 ldMAR = 1'b1;
						 NextState = Fetch1;
				 end
				 (Fetch1) : begin
						 ldPC = 1'b1;
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = Fetch2;
				 end
				 (Fetch2) : begin
						 ldIR = 1'b1;
						 enaMDR = 1'b1;
						 NextState = Decode;
				 end
				 (Decode) : begin
						if      (IR[15:12] == 4'b0000)  NextState = Branch0;
						else if (IR[15:12] == 4'b0001)  NextState = Add; 
					   else if (IR[15:12] == 4'b0010)  NextState = Load0;
						else if (IR[15:12] == 4'b0011)  NextState = Store0; 
						else if (IR[15:12] == 4'b0100)  NextState = JumpToSubroutine; 
						else if (IR[15:12] == 4'b0101)  NextState = And; 
						else if (IR[15:12] == 4'b0110)  NextState = LoadRelative0; 
						else if (IR[15:12] == 4'b0111)  NextState = StoreRelative0; 
					 //else if (IR[15:12] == 4'b1000)  NextState = ReturnFromInterrupt; 
						else if (IR[15:12] == 4'b1001)  NextState = Not; 
						else if (IR[15:12] == 4'b1010)  NextState = LoadIndirect0; 
						else if (IR[15:12] == 4'b1011)  NextState = StoreIndirect0; 
						else if (IR[15:12] == 4'b1100)  NextState = Jump; 
					 //else if (IR[15:12] == 4'b1101)  NextState = Reserved; 
						else if (IR[15:12] == 4'b1110)  NextState = LoadEffectiveAddress; 
					 //else if (IR[15:12] == 4'b1111)  NextState = TRAP(System Call); 
						
				 end
				 (Branch0) : begin
						 selEAB2 = 2'b10;
						if (JumpEnable == 1'b0)  NextState = Fetch0;
						else                     NextState = Branch1;
				 end
				 (Branch1) : begin
						 selPC = 2'b01;
						 ldMAR = 1'b1;
						 NextState = Fetch0;
				 end
				  (Add) : begin
						 aluControl = 2'b01;
						 SR1 = IR[8:6];
						 SR2 = IR[2:0];
						 DR = IR[11:9];
						 enaALU = 1'b1;
						 regWE = 1'b1;
						 flagWE = 1'b1;
						 NextState = Fetch0;
				 end
				  (Load0) : begin
						 selEAB2 = 2'b10;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = Load1;
				 end
				  (Load1) : begin
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = Load2;
				 end
				  (Load2) : begin
						 DR = IR[11:9];
						 regWE = 1'b1;
						 enaMDR = 1'b1;
						 flagWE = 1'b1;
						 NextState = Fetch0;
				 end
				  (Store0) : begin
						 selEAB2 = 2'b10;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = Store1;
				 end
				  (Store1) : begin
						 SR1 = IR[11:9];
						 enaALU = 1'b1;
						 ldMDR = 1'b1;
						 NextState = Store2;
				 end
				  (Store2) : begin
						 memWE = 1'b1;
						 NextState = Fetch0;
				 end
				  (JumpToSubroutine) : begin
						 DR = 3'b111;
						 regWE = 1'b1;
						 enaPC = 1'b1;
						if (IR[11] == 1'b0)  NextState = JumpToSubroutineBaseR;  
						else                 NextState = JumpToSubroutineOffset; 
				 end
				  (JumpToSubroutineOffset) : begin
						 selPC = 2'b01;
						 selEAB2 = 2'b11;
						 ldPC = 1'b1;
						 NextState = Fetch0;
				 end
				  (JumpToSubroutineBaseR) : begin
						 aluControl = 2'b00;
						 SR1 = IR[8:6];
						 selPC = 2'b10;
						 enaALU = 1'b1;
						 ldPC = 1'b1;
						 NextState = Fetch0;
				 end
				 (And) : begin
						 aluControl = 2'b10;
						 SR1 = IR[8:6];
						 SR2 = IR[2:0];
						 DR = IR[11:9];
						 enaALU = 1'b1;
						 regWE = 1'b1;
						 flagWE = 1'b1;
						 NextState = Fetch0;
				 end
				 (LoadRelative0) : begin
						 SR1 = IR[8:6];
						 selEAB1 = 1'b1;
						 selEAB2 = 2'b01;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = LoadRelative1;
				 end
				 (LoadRelative1) : begin
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = LoadRelative2;
				 end
				 (LoadRelative2) : begin
						 DR = IR[11:9];
						 regWE = 1'b1;
						 enaMDR = 1'b1;
						 NextState = Fetch0;
				 end
				 (StoreRelative0) : begin
						 SR1 = IR[8:6];
						 selEAB1 = 1'b1;
						 selEAB2 = 2'b01;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = StoreRelative1;
				 end
				 (StoreRelative1) : begin
						 aluControl = 2'b00;
						 SR1 = IR[11:9];
						 enaALU = 1'b1;
						 ldMDR = 1'b1;
						 NextState = StoreRelative2;
				 end
				 (StoreRelative2) : begin
						 memWE = 1'b1;
						 NextState = Fetch0;
				 end
				 (Not) : begin
						 aluControl = 2'b11;
						 SR1 = IR[8:6];
						 DR = IR[11:9];
						 enaALU = 1'b1;
						 regWE = 1'b1;
						 flagWE = 1'b1;
						 NextState = Fetch0;
				 end
				 (LoadIndirect0) : begin
						 selEAB2 = 2'b10;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = LoadIndirect1;
				 end
				 (LoadIndirect1) : begin
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = LoadIndirect2;
				 end
				 (LoadIndirect2) : begin
						 ldMAR = 1'b1;
						 enaMDR = 1'b1;
						 NextState = LoadIndirect3;
				 end
				 (LoadIndirect3) : begin
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = LoadIndirect4;
				 end
				 (LoadIndirect4) : begin
						 DR = IR[11:9];
						 regWE = 1'b1;
						 enaMDR = 1'b1;
						 NextState = Fetch0;
				 end
				 (StoreIndirect0) : begin
						 selEAB2 = 2'b10;
						 enaMARM = 1'b1;
						 ldMAR = 1'b1;
						 NextState = StoreIndirect1;
				 end
				 (StoreIndirect1) : begin
						 ldMDR = 1'b1;
						 selMDR = 1'b1;
						 NextState = StoreIndirect2;
				 end
				 (StoreIndirect2) : begin
						 ldMAR = 1'b1;
						 enaMDR = 1'b1;
						 NextState = StoreIndirect3;
				 end
				 (StoreIndirect3) : begin
						 aluControl = 2'b00;
						 SR1 = IR[11:9];
						 enaALU = 1'b1;
						 ldMDR = 1'b1;
						 NextState = StoreIndirect4;
				 end
				 (StoreIndirect4) : begin
						 memWE = 1'b1;
						 NextState = Fetch0;
				 end
				 (Jump) : begin
						 aluControl = 1'b1;
						 SR1 = IR[8:6];
						 selPC = 2'b10;
						 enaALU = 1'b1;
						 ldPC = 1'b1;
						 NextState = Fetch0;
				 end
				 (LoadEffectiveAddress) : begin
						 DR = IR[11:9];
						 selEAB2 = 2'b10;
						 regWE = 1'b1;
						 enaMARM = 1'b1;
						 NextState = Fetch0;
				 end			 				 
		endcase
	end
endmodule
