


module MOD4(inc,rst,clk,curS);
	input inc, rst, clk;
	output[1:0] curS;
	wire[1:0] nxtS;
	
	// next state logic
	//assign nxtS = (curS == 2'd3)? 0 : curS + 2'd1;
	assign nxtS = (inc == 1'd1)? curS + 2'd1 : curS;
	
	FF flip1(curS[1],clk,rst,nxtS[1]);
	FF flip0(curS[0],clk,rst,nxtS[0]);
	
	
endmodule


/*
module FF(q, clk, clr, d);
    input clk, clr, d;
    output reg q;

    always @(posedge clk)
        if (clr) q <= 0;
        else q <= d;
endmodule
*/