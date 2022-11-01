`timescale 1ns / 1ps
(* DONT_TOUCH = "yes" *)
module SLICE_A(
    input IN_0,
    input IN_1,
    input SEL_0,
    input EN,
    input SEL_1,
    output OUT_0,
    output OUT_1
    );
    
    (* dont_touch = "true" *) logic clba_out,clbb_out,muxout;
    
    (* dont_touch = "true" *) CLB_1 CLB_A(IN_0,IN_1,SEL_0,EN,clba_out);
    (* dont_touch = "true" *) CLB_1 CLB_B(IN_0,IN_1,SEL_0,EN,clbb_out);
    
    (* dont_touch = "true" *) MUX2_1 MUX(clba_out,clbb_out,SEL_1,OUT_0);
    
    (* dont_touch = "true" *) assign OUT_1 = OUT_0;
    
endmodule
