`timescale 1ns / 1ps

module key_expansion(key, count, key_out);
    
  //declaration of i/ps and o/p
  input [127:0] key;
  input [3:0] count;
  output [127:0] key_out;
    wire [31:0] w0,w1,w2,w3,w_3, temp;
  //internal variables
  assign w0 = key[127:96];
  assign w1 = key[95:64];
  assign w2 = key[63:32];
  assign w3 = key[31:0];
    
  //calculating g(w3)
    assign w_3 = {w3[23:0], w3[31:24]};   //one byte left circular rotation
    //substitute bytes using lookup table
    sub_byte s0(.in(w_3[7:0]),.sb(temp[7:0]));
    sub_byte s1(.in(w_3[15:8]),.sb(temp[15:8]));
    sub_byte s2(.in(w_3[23:16]),.sb(temp[23:16]));
    sub_byte s1(.in(w_3[31:24]), .sb(temp[31:24]));  
    assign key_out[127:96] = key[127:96]^temp^rcon(count);
    assign key_out[95:64] = key[95:64]^key_out[127:96];
    assign key_out[63:32] = key[63:32]^key_out[95:64];
    assign key_out[31:0] = key[31:0]^key_out[63:32];
  
    
  //To calculate round constant based on the round we're in 
       function [31:0]	rcon;
         input	[3:0]	count;
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
  

  
