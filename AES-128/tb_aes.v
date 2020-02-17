`timescale 1ns / 1ps
`include "aes_encrypt.v"

module tb_aes;
	// Inputs
	reg clk;
	// Outputs
	wire [7:0] data_out;
	reg [127:0] data_in;
	reg [127:0] key;
	initial begin 
    	clk =0;
	end
	initial begin
		#5;
		data_in = 128'h 3243f6a8885a308d313198a2e0370734;
		key = 128'h 2b7e151628aed2a6abf7158809cf4f3c;
		#5;
		$finish;
	end
	
	// Instantiate the Unit Under Test (UUT)
	always begin
		#1 clk = ~clk;
	end
	
	aes_encrypt u1(.clk(clk),.data_in(data_in),.key(key),.data_out(data_out));
	
      
endmodule
