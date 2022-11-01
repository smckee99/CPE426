`timescale 1ns / 1ps

(* KEEP_HIERARCHY = "yes" *)
module Lab01_Top(
    input [15:0] SWITCHES,
    input CLK,
    output [15:0] LEDS,
    output [3:0] ANODES,
    output [6:0] CATHODES,
    input BTNC
    );
    
    //PUF 
    logic [7:0] challenge = SWITCHES[7:0];
    logic en = SWITCHES[13]; //TODO: ASSIGN TO THE MIDDLE BUTTON
    logic done;
    logic [31:0] puf_out;
    
    assign LEDS[14] = done;
    //PUF 
    PUF myPuf(CLK,challenge,en,BTNC,done,puf_out);
    
    //SSEG default the valid to 1 for rn 
    sseg_des mySeg(puf_out[25:18],CLK,done,ANODES,CATHODES); 
    
endmodule
