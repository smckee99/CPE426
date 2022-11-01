`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module MUX2_1(
    input ZERO,
    input ONE,
    input SEL,
    output logic OUT
    );
    
    always_comb
    begin
        case(SEL)
            1'b0: OUT <= ZERO;
            1'b1: OUT <= ONE;
            default: OUT <= ZERO;
        endcase
   end
endmodule
