/***************************************************
* File: mux_testbench.v
* Author: Andrei Belov
* Class: EE 271
* Module: my_block
* Description: simple test block
****************************************************/

module my_block (
    input wire clock, reset,
    input wire [15:0] d,
    output reg [15:0] q );

    always @ (posedge clock, negedge reset)
        if ( ! reset ) q <= 0;
        else q <= d;
endmodule
