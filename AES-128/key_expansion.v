`timescale 1ns / 1ps

module key_expansion(key, count, key_out);
    
  //declaration of i/ps and o/p
  input [127:0] key;
  input [3:0] count;
  output [127:0] key_out;
  
  //internal variables
  assign w0 = key[127:96];
  assign w1 = key[95:64];
  assign w2 = key[63:32];
  assign w3 = key[31:0];
    
  //calculating g(w3)
    assign w_3 = {w3[23:16], w3[15:8], w3[7:0], w3[31:24]};   //one byte left circular rotation
    assign w3 = sub_byte(w_3);                               //substitute bytes using lookup table
    assign temp = count;
    case(temp)	
         4'h0: assign rcon=32'h01_00_00_00;
         4'h1: assign rcon=32'h02_00_00_00;
         4'h2: assign rcon=32'h04_00_00_00;
         4'h3: assign rcon=32'h08_00_00_00;
         4'h4: assign rcon=32'h10_00_00_00;
         4'h5: assign rcon=32'h20_00_00_00;
         4'h6: assign rcon=32'h40_00_00_00;
         4'h7: assign rcon=32'h80_00_00_00;
         4'h8: assign rcon=32'h1b_00_00_00;
         4'h9: assign rcon=32'h36_00_00_00;
         default: assign rcon=32'h00_00_00_00;
       endcase
                                      //round constant
    assign key_out[127:96] = w0^w3^rcon;
    assign key_out[95:64] = w1^w0^w3^rcon;
    assign key_out[63:32] = w2^w1^w0^w3^rcon;
    assign key_out[95:64] = w3^w2^w1^w0^w3^rcon;
  
  //To calculate round constant based on the round we're in 


  
endmodule
    
