`timescale 1ns / 1ps

module round(data,key_in,out);
//input [3:0]rc;
input [127:0]data;
input [127:0]key_in;
  output [127:0] out;
//tput [127:0]rndout;
wire [127:0] sb,sr,mc;
//encrypts data for a given round taking round_count as input
//y_expansion t0(rc,key_in,key_out);
  sub_byte t1(.in(data),.sb(sb));
  shift_rows t2(.in(sb),.out(sr));
  mix_columns t3(.in(sr),.out(mc));
assign out = mc ^ key_in;
endmodule
