`timescale 1ns / 1ps

module last_round(clk,rc,r_in,key_last,data_out);
input clk;
input [3:0]rc;
input [127:0]r_in;
input [127:0]key_last;
output [127:0]data_out;

wire [127:0] sb,sr,mc,key_out;
//last round of operations doesn't involve mix_columns
KeyGeneration t0(rc,key_last,key_out);
subbytes t1(r_in,sb);
shiftrow t2(sb,sr);
assign data_out= key_out^sr;

endmodule
