`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module SLICE_B(
    input IN_0,
    input IN_1,
    input SEL_0,
    input SEL_1,
    output OUT_0,
    output OUT_1
    );
    
    (* dont_touch = "true" *)logic clb_a_out,clb_b_out;
    
    (* dont_touch = "true" *) CLB_2 CLB_A(IN_0,IN_1,SEL_0,clb_a_out);
    (* dont_touch = "true" *) CLB_2 CLB_B(IN_0,IN_1,SEL_0,clb_b_out);
    
    (* dont_touch = "true" *) MUX2_1 MUX(clb_a_out,clb_b_out,SEL_1,OUT_0);
    
    (* dont_touch = "true" *) assign OUT_1 = OUT_0;
endmodule
