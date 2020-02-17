`timescale 1ns / 1ps



module aes_top(
    input [127:0] data_in,
    input [127:0] key,
    input clk,
    input reset,
    output reg [127:0] cryptokey
    );
    
    
    wire [127:0]out;
    first_round FR(.out(out[127:0]),.data_in(ir_in[127:0]),.key(ir_key[127:0]));
     
    
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
    
    wire [127:0] r1_out;
    wire [127:0] r2_out;
    wire [127:0] r3_out;
    wire [127:0] r4_out;
    wire [127:0] r5_out;
    wire [127:0] r6_out;
    wire [127:0] r7_out;
    wire [127:0] r8_out;
    wire [127:0] r9_out;
    
    //initial round
    reg [127:0]ir_in;
    reg [127:0]ir_key;
     
    //initial round -> R1
    reg [127:0]r1_in;
    reg [127:0]k1_key;
    
    //R1 -> R2
    reg [127:0]r2_in;
    reg [127:0]k2_key;    
    
    //R2-> R3
    reg [127:0]r3_in;
    reg [127:0]k3_key;
        
    //R3-> R4
    reg [127:0]r4_in;
    reg [127:0]k4_key;
    
    //R4 -> R5
    reg [127:0]r5_in;
    reg [127:0]k5_key;
    
    //R5 -> R6
    reg [127:0]r6_in;
    reg [127:0]k6_key;
    
    //R6 -> R7
    reg [127:0]r7_in;
    reg [127:0]k7_key;
    
    //R7 -> R8
    reg [127:0]r8_in;
    reg [127:0]k8_key;
    
    //R8 -> R9
    reg [127:0]r9_in;
    reg [127:0]k9_key;
    
     //R9 -> Final Round
    reg [127:0]fr_in;
    reg [127:0]k10_key;
    
    
    key_expansion k1(.key(ir_key[127:0]),.count(4'b0001),.key_out(key_1[127:0]));
    key_expansion k2(.key(k1_key[127:0]),.count(4'b0010),.key_out(key_2[127:0])); 
    key_expansion k3(.key(k2_key[127:0]),.count(4'b0011),.key_out(key_3[127:0])); 
    key_expansion k4(.key(k3_key[127:0]),.count(4'b0100),.key_out(key_4[127:0])); 
    key_expansion k5(.key(k4_key[127:0]),.count(4'b0101),.key_out(key_5[127:0])); 
    key_expansion k6(.key(k5_key[127:0]),.count(4'b0110),.key_out(key_6[127:0])); 
    key_expansion k7(.key(k6_key[127:0]),.count(4'b0111),.key_out(key_7[127:0])); 
    key_expansion k8(.key(k7_key[127:0]),.count(4'b1000),.key_out(key_8[127:0])); 
    key_expansion k9(.key(k8_key[127:0]),.count(4'b1001),.key_out(key_9[127:0])); 
    key_expansion k10(.key(k9_key[127:0]),.count(4'b1010),.key_out(key_10[127:0])); 
 
       
    round r1(.data(r1_in[127:0]),.key_in(k1_key[127:0]), .out(r1_out[127:0]));
    round r2(.data(r2_in[127:0]),.key_in(k2_key[127:0]), .out(r2_out[127:0]));
    round r3(.data(r3_in[127:0]),.key_in(k3_key[127:0]), .out(r3_out[127:0]));
    round r4(.data(r4_in[127:0]),.key_in(k4_key[127:0]), .out(r4_out[127:0]));
    round r5(.data(r5_in[127:0]),.key_in(k5_key[127:0]), .out(r5_out[127:0]));
    round r6(.data(r6_in[127:0]),.key_in(k6_key[127:0]), .out(r6_out[127:0]));
    round r7(.data(r7_in[127:0]),.key_in(k7_key[127:0]), .out(r7_out[127:0]));
    round r8(.data(r8_in[127:0]),.key_in(k8_key[127:0]), .out(r8_out[127:0]));
    round r9(.data(r9_in[127:0]),.key_in(k9_key[127:0]), .out(r9_out[127:0]));
    
 
    
    wire [127:0]encrypted_text;     //output from final round
    
    last_round lr(.in(fr_in[127:0]),.key_last(k10_key[127:0]),.data_out(encrypted_text[127:0]));
    
    
    
    always@(negedge clk)
    begin
        if(reset==1'b0)
        begin
            ir_in <= 128'h0;
            ir_key<= 128'h0;
            r1_in <= 128'h0;
            k1_key<= 128'h0;
            r2_in <= 128'h0;
            k2_key<= 128'h0;
            r3_in <= 128'h0;
            k3_key<= 128'h0;
            r4_in <= 128'h0;
            k4_key<= 128'h0;
            r5_in <= 128'h0;
            k5_key<= 128'h0;
            r6_in <= 128'h0;
            k6_key<= 128'h0;
            r7_in <= 128'h0;
            k7_key<= 128'h0;
            r8_in <= 128'h0;
            k8_key<= 128'h0;
            r9_in <= 128'h0;
            k9_key<= 128'h0;      
            fr_in <= 128'h0;
            k10_key<=128'h0;
            
            cryptokey <= 128'h0;                                                                                          
        end
        else
        begin
            ir_in <=plaintext;
            ir_key<=userkey;
            r1_in <=IR_out;
            k1_key<=key_1;
            r2_in <=r1_out;
            k2_key<=key_2;
            r3_in <=r2_out;
            k3_key<=key_3;
            r4_in <=r3_out;
            k4_key<=key_4;
            r5_in <=r4_out;
            k5_key<=key_5;
            r6_in <=r5_out;
            k6_key<=key_6;
            r7_in <=r6_out;
            k7_key<=key_7;
            r8_in <=r7_out;
            k8_key<=key_8;
            r9_in <=r8_out;
            k9_key<=key_9;
            fr_in <=r9_out;
            k10_key<=key_10;
            
            cryptokey <= encrypted_text;                                                                                                
        end
    end

      
endmodule
