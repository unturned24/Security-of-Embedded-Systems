`timescale 1ns / 1ps
`include "key_expansion.v"
`include "sub_byte.v"
`include "shift_rows.v"
`include "mix_columns.v"

module round(clk,rc,data,key_in,key_out,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]key_in;
output [127:0]key_out;
output [127:0]rndout;

wire [127:0] sb,sr,mc;
//encrypts data for a given round taking round_count as input
  key_expansion t0(clk,rc,key_in,key_out);
  sub_byte t1(clk,data,sb);
  shift_rows t2(clk,sb,sr);
  mix_columns t3(clk, sr,mc);
assign rndout= key_out^mc; //addroundkey()

endmodule
