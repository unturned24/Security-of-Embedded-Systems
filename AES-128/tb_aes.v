`timescale 1ns / 1ps
//`include "aes_top.v"

module tb_aes;
	// Inputs
	reg clk;
	// Outputs
	wire [7:0] final_out;

	// Instantiate the Unit Under Test (UUT)
	aes_top dut (
		.clk(clk), 
		.final_out(final_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
	end
      
endmodule
