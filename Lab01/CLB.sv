`timescale 1ns / 1ps


module CLB(
    input IN_0,
    input IN_1,
    input SEL_0,
    input SEL_1,
    output CLB_OUT
    );
    
    logic NOT_0,NOT_1,OUT_1;
    always_comb
    begin
        NOT_0 = ~IN_0;
        NOT_1 = ~IN_1;
    end
    
    MUX2_1 MUXA(NOT_0,NOT_1,SEL_0,OUT_1);
    MUX2_1 MUXB(OUT_1,1'b0,SEL_1,CLB_OUT);
    
endmodule
