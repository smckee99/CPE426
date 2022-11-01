`timescale 1ns / 1ps
(* dont_touch = "true" *)
module Config_RO(
    input SEL_0,
    input SEL_1,
    input SEL_2,
    input EN,
    input BX0,
    input BX1,
    input BX2,
    output reg RO_OUT
    );
    
    (* dont_touch = "true" *) logic in_0,in_1,out_0,out_1,out_2,out_3;

    
    initial 
    begin
        in_0 = 1'b1;
        in_1 = 1'b1;
    end
    //SLICE X0Y1
    (* dont_touch = "true" *) SLICE_A slice_x0y1(in_0,in_1,SEL_0,EN,BX0,out_0,out_1);
    
    //SLICE X0Y0
    (* dont_touch = "true" *) SLICE_B slice_x0y0(out_1,out_0,SEL_1,BX1,out_2,out_3);
    
    //SLICE X1Y1
   (* dont_touch = "true" *) SLICE_B slice_x1y1(out_2,out_3,SEL_2,BX2,in_0,in_1);
    
    (* dont_touch = "true" *) assign RO_OUT = in_0;  
    //SLICE X1Y0
    //SLICE_C slice_x1y0(out_4,out_5,SEL_3,BX3,in_1,in_0);
    
endmodule
