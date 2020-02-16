`timescale 1ns / 1ps
`include "round.v"
`include "last_round.v"

module aes_encrypt(clk,data_in,key,data_out);

    input clk;
    input [127:0] data_in;
    input [127:0] key;
    output[127:0] data_out;
    
    wire [127:0] r0_out,r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9;
	 //encrypts plain text by using the modules created for each step for 10 rounds
	 assign r0_out = data_in^key;
	 
    round r1(.clk(clk),.rc(4'b0000),.data(r0_out),.key_in(key),.key_out(keyout1),.rndout(r1_out));
    round r2(.clk(clk),.rc(4'b0001),.data(r1_out),.key_in(keyout1),.key_out(keyout2),.rndout(r2_out));
    round r3(.clk(clk),.rc(4'b0010),.data(r2_out),.key_in(keyout2),.key_out(keyout3),.rndout(r3_out));
    round r4(.clk(clk),.rc(4'b0011),.data(r3_out),.key_in(keyout3),.key_out(keyout4),.rndout(r4_out));
    round r5(.clk(clk),.rc(4'b0100),.data(r4_out),.key_in(keyout4),.key_out(keyout5),.rndout(r5_out));
    round r6(.clk(clk),.rc(4'b0101),.data(r5_out),.key_in(keyout5),.key_out(keyout6),.rndout(r6_out));
    round r7(.clk(clk),.rc(4'b0110),.data(r6_out),.key_in(keyout6),.key_out(keyout7),.rndout(r7_out));
    round r8(.clk(clk),.rc(4'b0111),.data(r7_out),.key_in(keyout7),.key_out(keyout8),.rndout(r8_out));
    round r9(.clk(clk),.rc(4'b1000),.data(r8_out),.key_in(keyout8),.key_out(keyout9),.rndout(r9_out));
    last_round r10(.clk(clk),.rc(4'b1001),.rin(r9_out),.key_last(keyout9),.data_out(data_out));
    
endmodule
