`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module CLB_1(
    input IN_0,
    input IN_1,
    input SEL_0,
    input SEL_1,
    output CLB_OUT
    );
    
    (* DONT_TOUCH = "yes" *)logic NOT_0,NOT_1,OUT_0;
    always_comb
    begin
        NOT_0 = ~IN_0;
        NOT_1 = ~IN_1;
    end
    
    (* DONT_TOUCH = "yes" *)MUX2_1 MUXA(NOT_0,NOT_1,SEL_0,OUT_0);
    (* DONT_TOUCH = "yes" *)MUX2_1 MUXB(1'b0,OUT_0,SEL_1,CLB_OUT);
    
endmodule
