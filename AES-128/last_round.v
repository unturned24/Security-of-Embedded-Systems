`timescale 1ns / 1ps

module last_round(in,key_last,data_out);
input [127:0]in;
input [127:0]key_last;
output [127:0]data_out;

  wire [127:0] sb,sr_out,sr,mod_key,key_out;
  assign mod_key = {key_last[127:120],key_last[95:88],key_last[63:56],key_last[31:24],key_last[119:112],key_last[87:80],key_last[55:48],key_last[23:16],key_last[111:104],key_last[79:72],key_last[47:40],key_last[15:8],key_last[103:96],key_last[71:64],key_last[39:32],key_last[7:0]};
        
//last round of operations doesn't involve mix_columns
//key_expansion t0(rc,key_last,key_out);
sub_byte t1(in,sb);
shift_rows t2(sb,sr_out);
assign sr = {sr_out[127:120],sr_out[95:88],sr_out[63:56],sr_out[31:24],sr_out[119:112],sr_out[87:80],sr_out[55:48],sr_out[23:16],sr_out[111:104],sr_out[79:72],sr_out[47:40],sr_out[15:8],sr_out[103:96],sr_out[71:64],sr_out[39:32],sr_out[7:0]};
assign out = sr ^ mod_key;
assign data_out = {out[127:120],out[95:88],out[63:56],out[31:24],out[119:112],out[87:80],out[55:48],out[23:16],out[111:104],out[79:72],out[47:40],out[15:8],out[103:96],out[71:64],out[39:32],out[7:0]};    
endmodule
