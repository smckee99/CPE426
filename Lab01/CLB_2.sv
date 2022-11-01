`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module CLB_2(
    input IN_0,
    input IN_1,
    input SEL_0,
    output CLB_OUT
    );
    
    logic VAL_0,VAL_1,OUT_1;
    always_comb
    begin
        VAL_0 = ~IN_0;
        VAL_1 = ~IN_1;
    end
    
    MUX2_1 MUXA(VAL_0,VAL_1,SEL_0,CLB_OUT);
    
endmodule
