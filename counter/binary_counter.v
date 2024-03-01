/***************************************************
* File: binary_counter.v
* Author: Andrei Belov
* Class: EE 271
* Module: Counter
* Description: A simple Binary Counter circuit
****************************************************/

// Binary Counter
//
module Counter(
    input wire[3:0] d,
    input wire clk, reset, load, en,
    output reg[3:0] q
);
    always @(posedge clk)
        begin
            if (reset)  // synchronous reset
                q <= 0;
            else if (load == 1'b1)
                q <= d;
            else if (en == 1'b1)
                q <= q+1;
        end
endmodule
