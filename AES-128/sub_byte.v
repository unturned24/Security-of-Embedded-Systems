`timescale 1ns / 1ps
`include "sub_lookup.v"
module sub_byte(in,sb);

input [127:0] in;
output [127:0] sb;

     sbox q0( .a(in[127:120]),.c(sb[127:120]) );
     sbox q1( .a(in[119:112]),.c(sb[119:112]) );
     sbox q2( .a(in[111:104]),.c(sb[111:104]) );
     sbox q3( .a(in[103:96]),.c(sb[103:96]) );
     
     sbox q4( .a(in[95:88]),.c(sb[95:88]) );
     sbox q5( .a(in[87:80]),.c(sb[87:80]) );
     sbox q6( .a(in[79:72]),.c(sb[79:72]) );
     sbox q7( .a(in[71:64]),.c(sb[71:64]) );
     
     sbox q8( .a(in[63:56]),.c(sb[63:56]) );
     sbox q9( .a(in[55:48]),.c(sb[55:48]) );
     sbox q10(.a(in[47:40]),.c(sb[47:40]) );
     sbox q11(.a(in[39:32]),.c(sb[39:32]) );
     
     sbox q12(.a(in[31:24]),.c(sb[31:24]) );
     sbox q13(.a(in[23:16]),.c(sb[23:16]) );
     sbox q14(.a(in[15:8]),.c(sb[15:8]) );
     sbox q16(.a(in[7:0]),.c(sb[7:0]) );
	  
endmodule
