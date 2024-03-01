/* Example:  Multiply-Accumulator */

`timescale 1ns/100ps  // time resolution/precis for sim
module mult_acc(             // module and name

    input[7:0] data1, data2,       // I. port declarations
    input clk, aclr,                   // I. port declarations
    output reg[15:0] mac_out); // I. port declarations

    wire[15:0] mult_out, add_out; // II. variable definition

    parameter mult_size = 8;    // III. parameter

    assign add_out = mult_out+mac_out;  // IV.dataflow

    multiplr#(.width_in(mult_size))    // V. instantiation
        u1(
            .in_a(data1),
            .in_b(data2),
            .mult_out(mult_out)
        );

    always @(posedge clk, posedge aclr) begin
        if (aclr)                                    // VI. behavioral block
            mac_out <= 16'h0000;
        else
            mac_out <= adder_out;
    end                                        // end behavioral block
endmodule
