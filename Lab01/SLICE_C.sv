`timescale 1ns / 1ps

module SLICE_C(
    input IN_0,
    input IN_1,
    input SEL_0,
    input SEL_1,
    output OUT_0,
    output OUT_1
    );
    
    logic clb_a_out,clb_b_out;
    
    CLB_3 CLB_A(IN_0,IN_1,SEL_0,clb_a_out);
    CLB_3 CLB_B(IN_0,IN_1,SEL_0,clb_b_out);
    
    MUX2_1 MUX(clb_a_out,clb_b_out,SEL_1,OUT_0);
    
    //TODO ADD LATCH
    
endmodule
