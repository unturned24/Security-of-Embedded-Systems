`timescale 1ns / 1ps

module aes_top(
    input [127:0] data_in,
    input [127:0] key,
    input clk,
    input reset,
    output reg [127:0] cryptokey
    );
    
    
    wire [127:0] out;
    first_round FR(.out(out),.data(data_in),.key_in(key));
     
    
    wire [127:0]key_1;
    wire [127:0]key_2;
    wire [127:0]key_3;
    wire [127:0]key_4;
    wire [127:0]key_5;
    wire [127:0]key_6;
    wire [127:0]key_7;
    wire [127:0]key_8;
    wire [127:0]key_9;
    wire [127:0]key_10;
    
    //round count to be sent to keyexpansion module 
    //reg [3:0]count;
    
     reg [3:0]counter;           //depicts number of round
    reg [127:0]immed_text;      //input to the round_box
    reg [127:0]round_key_in;    //key input to the round_box
    reg [127:0]final_round_in;  //text input for final round
    
    key_expansion k1(.key(key[127:0]),.count(4'b0001),.key_out(key_1[127:0]));
    key_expansion k2(.key(key_1[127:0]),.count(4'b0010),.key_out(key_2[127:0])); 
    key_expansion k3(.key(key_2[127:0]),.count(4'b0011),.key_out(key_3[127:0])); 
    key_expansion k4(.key(key_3[127:0]),.count(4'b0100),.key_out(key_4[127:0])); 
    key_expansion k5(.key(key_4[127:0]),.count(4'b0101),.key_out(key_5[127:0])); 
    key_expansion k6(.key(key_5[127:0]),.count(4'b0110),.key_out_out(key_6[127:0])); 
    key_expansion k7(.key(key_6[127:0]),.count(4'b0111),.key_out(key_7[127:0])); 
    key_expansion k8(.key(key_7[127:0]),.count(4'b1000),.key_out(key_8[127:0])); 
    key_expansion k9(.key(key_8[127:0]),.count(4'b1001),.key_out(key_9[127:0])); 
    key_expansion k10(.key(key_9[127:0]),.count(4'b1010),.key_out(key_10[127:0]));   

      //round count output
      wire [127:0]count_out;   
        
      round r1(.data(immed_text),.key_in(round_key_in), .out(count_out));

    
    
    wire [127:0]encrypted_text;     //output from final round
    finalRound fr(.in(immed_text[127:0]),.key_last(key_10[127:0]),.data_out(encrypted_text[127:0]));
    
    
   
    
    always@(negedge clk)
    begin
        if(reset == 1'b0)
        begin
            counter          <=0;
            immed_text       <=0;
            round_key_in     <=0;
            final_round_in   <=0;
            
        end
    
        else if(counter == 0)
        begin
            immed_text <= out[127:0];
            counter    <= counter+1;
            round_key_in <= key_1; 
        end
    
        else if(counter == 4'hA)   
        begin
               //round_key_in   <= key_10;                                                              
               //final_round_in <= count_out;  
               cryptokey <=  encrypted_text;
        end
        
        else if(counter >= 4'h1 && counter <= 4'h9)
        begin
            immed_text <= count_out;
            case(counter)
            4'h1 : begin
                    counter      <= counter+1;
                    round_key_in <= key_2; 
                    end
            4'h2 : begin
                    counter      <= counter+1;
                    round_key_in <= key_3; 
                    end
            4'h3 : begin
                    counter      <= counter+1;
                    round_key_in <= key_4; 
                    end
            4'h4 : begin
                    counter <= counter+1;
                    round_key_in <= key_5;
                    end
            4'h5 : begin
                    counter <= counter+1;
                    round_key_in <= key_6;
                    end
            4'h6 : begin
                    counter <= counter+1;
                    round_key_in <= key_7;
                    end
            4'h7 : begin
                    counter <= counter+1;
                    round_key_in <= key_8;
                    end                
            4'h8 : begin
                    counter <= counter+1;
                    round_key_in <= key_9;
                   end    
            4'h9 : begin
                    counter <= counter+1;
                    round_key_in <= key_10;
                    final_round_in <= count_out;
                   end
            /*4'hA :begin
                    counter <= counter+1;
                    round_key_in <= key_10;
                    end*/
             default: round_key_in <= 128'h0;
             endcase
          end
          
                     
                
        
    end
      
      
endmodule
