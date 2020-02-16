`timescale 1ns / 1ps

module last_round(clk,rc,rin,key_last,data_out);
input clk;
input [3:0]rc;
input [127:0]rin;
input [127:0]key_last;
output [127:0]data_out;

wire [127:0] sb,sr,mc,key_out;
//last round of operations doesn't involve mix_columns
key_expansion t0(rc,key_last,key_out);
sub_byte t1(rin,sb);
shift_rows t2(sb,sr);
assign data_out= key_out^sr;

endmodule
