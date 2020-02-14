`timescale 1ns / 1ps

module key_expansion{
    key,
    count,
    key_out
}
  //declaration of i/ps and o/p
  input [127:0] key;
  input [3:0] RCon;
  output [127:0] key_out;
  
  //internal variables
  assign w0 = key[127:96];
  assign w1 = key[95:64];
  assign w2 = key[63:32];
  assign w3 = key[31:0];
  //calculating g(w3)
  assign w_3 = {w3[23:16], w3[15:8], w3[7:0], w3[31:24]};
  assign w3 = sub(w_3);
  assign temp = rcon;
  assign key_out[127:96] = w0^w3^temp;
  assign key_out[95:64] = w1^w0^w3^temp;
  assign key_out[63:32] = w2^w1^w0^w3^temp;
  assign key_out[95:64] = w3^w2^w1^w0^w3^temp;
  
  //To calculate round constant based on the round we're in 
  function [32:0] rc;
    input [3:0] count;
    case(count)	
         4'h0: rcon=32'h01_00_00_00;
         4'h1: rcon=32'h02_00_00_00;
         4'h2: rcon=32'h04_00_00_00;
         4'h3: rcon=32'h08_00_00_00;
         4'h4: rcon=32'h10_00_00_00;
         4'h5: rcon=32'h20_00_00_00;
         4'h6: rcon=32'h40_00_00_00;
         4'h7: rcon=32'h80_00_00_00;
         4'h8: rcon=32'h1b_00_00_00;
         4'h9: rcon=32'h36_00_00_00;
         default: rcon=32'h00_00_00_00;
       endcase

     endfunction
  
endmodule
    
