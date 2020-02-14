`timescale 1ns / 1ps

module round(clk,rc,data,key_in,key_out,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]key_in;
output [127:0]key_out;
output [127:0]rndout;

wire [127:0] sb,sr,mc;
//encrypts data for a given round taking round_count as input
KeyGeneration t0(rc,key_in,key_out);
subbytes t1(data,sb);
shiftrow t2(sb,sr);
mixcolumn t3(sr,mc);
assign rndout= keyout^mc; //addroundkey()

endmodule
