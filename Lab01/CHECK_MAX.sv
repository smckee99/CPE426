`timescale 1ns / 1ps

(* dont_touch = "true" *)
module CHECK_MAX(
    input [15:0] VAL,
    output reg max
    );
    
    initial 
    begin
        max <= 1'b0;
    end
    
    always_comb 
    begin
        if(VAL > 16'b1111111111111111)
        begin
            max <= 1'b1;
        end
        else 
        begin
            max <= 1'b0;
        end 
    end
endmodule
