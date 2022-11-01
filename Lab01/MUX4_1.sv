`timescale 1ns / 1ps

module MUX4_1(
        input ZERO,ONE,TWO,THREE,
        input [1:0] SEL,
        output logic OUT
    );
    
    always_comb
    begin
        case(SEL)
            2'b00: OUT <= ZERO;
            2'b01: OUT <= ONE;
            2'b10: OUT <= TWO;
            2'b11: OUT <=THREE;
            default: OUT <= ZERO;
        endcase
   end
   
endmodule
