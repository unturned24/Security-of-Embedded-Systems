`timescale 1ns / 1ps

module first_round(data,key_in,out);
input [127:0]data;
input [127:0]key_in;
output [127:0] out;

assign out = data ^ key_in;
endmodule
