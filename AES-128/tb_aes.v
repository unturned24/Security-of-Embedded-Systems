`timescale 1ns / 1ps
//`include "aes_top.v"

module tb_aes;
	// Inputs
	reg clk;
	// Outputs
	wire [7:0] final_out;
	initial begin 
    		forever begin
    		clk = 0;
    		#1 clk = ~clk;
		 end end
	// Instantiate the Unit Under Test (UUT)
	aes_top dut ( .clk(clk), .data_out(final_out));
	
	
      
endmodule
