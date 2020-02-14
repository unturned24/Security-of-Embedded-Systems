  
`timescale 1ns / 1ps

module aes_top(clk,final_out);
    input clk;
    output [7:0] final_out;

wire [127:0] tempout;

aes_encrypt u1(.clk(clk),.data_in(128'h 3243f6a8885a308d313198a2e0370734),.key(128'h 2b7e151628aed2a6abf7158809cf4f3c),.data_out(tempout));

assign final_out = tempout[127:120];

endmodule
