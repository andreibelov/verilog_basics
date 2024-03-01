/***************************************************
* File: d_latch.v
* Author: Andrei Belov
* Class: EE 271
* Module: DLatches
* Description: syncronous and asyncronous D latches
****************************************************/

// D latches
//
module DLatches(d, clk, aclr, qldc, qld);
    input d, clk, aclr;
    output reg qldc, qld;

    // syncronous d-latch
    always @(clk or d)   // no posedge!
        begin
            if (clk == 1) qld <= d;
        end

    // asyncronous d-latch
    always @(clk or d or aclr)
        // note d is on the sensitivity list
        begin
            if (aclr == 1) qldc <= 0;
            else if (clk == 1) qldc <= d;
        end
endmodule // DLatches