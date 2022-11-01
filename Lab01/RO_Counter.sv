`timescale 1ns / 1ps

(* DONT_TOUCH = "yes" *)
module RO_Counter(
    input CLK,
    input EN,
    input RST,
    output reg [32:0] COUNT,
    output reg DONE
    );
    
    always @ (posedge CLK)
    
    //psuedocode 
    //at posedge, if reset, set to zero, else if enable, count by 1, else grab same value
    begin
        if(EN==1'b1 && RST == 1'b0) begin
            COUNT += 1;
            DONE = 1'b0;
        end
        if(RST==1'b1) begin
            COUNT <= 0;
        end
        else begin
            DONE = 1'b1;
        end
    end
       
endmodule
