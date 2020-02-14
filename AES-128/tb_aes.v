`timescale 1ns / 1ps

module tb_aes(clk,data_in,key,data_out);
    input clk;
    input [127:0] data_in;
    input [127:0] key;
    output [127:0] data_out;
    reg clk;

aes_encrypt AE1(.clk(clk),.data_in(128'h 3243f6a8885a308d313198a2e0370734),.key(128'h 2b7e151628aed2a6abf7158809cf4f3c),.data_out(data_out));

initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

endmodule
