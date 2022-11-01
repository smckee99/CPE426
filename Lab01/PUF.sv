`timescale 1ns / 1ps
(* KEEP_HIERARCHY = "yes" *)
module PUF(
    input clk,
    input [7:0] CHALLENGE,
    input EN,
    input RST,
    output reg DONE,
    output reg [32:0] PUF_out
    );
//    (* dont_touch = "true" *)logic [32:0] ro_count;
    (* dont_touch = "true" *)logic [32:0] clk_count;
    (* dont_touch = "true" *)logic [2:0] sel = CHALLENGE[5:3];
    (* dont_touch = "true" *)logic [2:0] bx = CHALLENGE[2:0];
    (* dont_touch = "true" *)logic [1:0] muxSel = CHALLENGE[7:6];
    (* dont_touch = "true" *)logic muxOut,counter_en;
    (* dont_touch = "true" *)logic ro_0_out,ro_1_out,ro_2_out,ro_3_out;
    reg max_count;
    
    //set up 4 RO's
    (* dont_touch = "true" *)Config_RO Novel_Conf_RO_0(sel[0],sel[1],sel[2],EN,bx[0],bx[1],bx[2],ro_0_out);
    
    (* dont_touch = "true" *)Config_RO Novel_Conf_RO_1(sel[0],sel[1],sel[2],EN,bx[0],bx[1],bx[2],ro_1_out);
    
    (* dont_touch = "true" *)Config_RO Novel_Conf_RO_2(sel[0],sel[1],sel[2],EN,bx[0],bx[1],bx[2],ro_2_out);
    
    (* dont_touch = "true" *)Config_RO Novel_Conf_RO_3(sel[0],sel[1],sel[2],EN,bx[0],bx[1],bx[2],ro_3_out);
    
    (* dont_touch = "true" *)MUX4_1 RO_Select(ro_0_out,ro_1_out,ro_2_out,ro_3_out,muxSel,muxOut);
    
    //Set maxcount to change on the clk edge
    //(* dont_touch = "true" *)CHECK_MAX max_check(clk_count,max_count);
    
    (* dont_touch = "true" *)assign counter_en = EN & ~DONE;
//     assign counter_en = EN;
    
    
//    RO_Counter RO_Counter(muxOut,counter_en,PUF_out,DONE);
    (* dont_touch = "true" *)RO_Counter RO_Counter(muxOut,counter_en,RST,PUF_out);
    (* dont_touch = "true" *)RO_Counter Std_Counter(clk,counter_en,RST,clk_count); //we dont need done
    
    (* dont_touch = "true" *)always @ (posedge clk)
    begin
        if(clk_count > 32'h2FAF080) begin
            DONE <= 1'b1;
        end
        else begin
            DONE <= 1'b0;
        end
    end
    
endmodule
