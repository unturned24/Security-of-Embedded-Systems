`timescale 1ns / 1ps

`define HalfClockPeriod 60
`define ClockPeriod `HalfClockPeriod * 2
module tb_aes_pipeline;
//INPUTS
reg [127:0]data_in;
reg [127:0]key;
reg clk;
reg reset;
wire [127:0] cryptokey;

aes_top UUT(
            .data_in(data_in),
            .key(key),
            .clk(clk),
            .reset(reset),
            .cryptokey(cryptokey)
            );
            
initial begin
           //initialize input
           data_in = 0;
           key   = 0;
           reset     = 1;
           
           //wait for global reset
           #(1*`ClockPeriod);
           
           //TEST
           #1
           reset = 0;
           data_in = 0;
           key   = 0;
           
           #(1*`ClockPeriod);
           reset = 1;          
           data_in = 128'h0123456789abcdeffedcba9876543210; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798; //0f1571c947d9e8590cb7add6af7f6798 - 000102030405060708090a0b0c0d0e0f
           //cryptokey = ff0b844a0853bf7c6934ab4364148fb9
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h0123456789abcdeffedcba9876543210; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798 ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = ff0b844a0853bf7c6934ab4364148fb9
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h0123456789abcdeffedcba9876543210 ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798 ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h0123456789abcdeffedcba9876543210 ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798 ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h0123456789abcdeffedcba9876543210 ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798 ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h0123456789abcdeffedcba9876543210 ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h0f1571c947d9e8590cb7add6af7f6798 ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a
           
           #(1*`ClockPeriod);
           data_in = 128'h00112233445566778899aabbccddeeff ; //00112233445566778899aabbccddeeff -> h0123456789abcdeffedcba9876543210
           key   = 128'h000102030405060708090a0b0c0d0e0f ; //0f1571c947d9e8590cb7add6af7f6798 -> 000102030405060708090a0b0c0d0e0f
           //cryptokey = 69c4e0d86a7b0430d8cdb78070b4c55a                                                                                                   
           
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test1 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
                       $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test2 passed! cipher_text : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);           
           
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test3 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test4 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);
            
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test5 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test6 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);
            
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test7 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test8 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);
            
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test9 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test10 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);
            
           #(1*`ClockPeriod);
           if(cryptokey == 128'hff0b844a0853bf7c6934ab4364148fb9) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test11 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey); 
           #(1*`ClockPeriod);
           if(cryptokey == 128'h69c4e0d86a7b0430d8cdb78070b4c55a) //69c4e0d86a7b0430d8cdb78070b4c55a->ff0b844a0853bf7c6934ab4364148fb9
                       $display ("Test12 passed! data_in : %x , key : %x and cipher_key : %x", data_in, key, cryptokey);
           else     
            $display ("failed: %x should be 128'hff0b844a0853bf7c6934ab4364148fb9",cryptokey);                                                  
           
                      
             $stop;   
end
initial begin
    clk = 0;
end
always begin
    #`HalfClockPeriod clk = ~clk;
    #`HalfClockPeriod clk = ~clk;
   end
endmodule
