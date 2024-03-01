/***************************************************
* File: comparator.v
* Author: Andrei Belov
* Class: EE 271
* Module: comparator
* Description: A simple comparator circuit
****************************************************/

// Structural
module comparator4
    (input[3:0] a, b, output out);   // Verilog-2001 Syntax

    wire n0, n1, n2, n3;
    xnor xnor0(n0, a[0], b[0]);
    xnor xnor1(n1, a[1], b[1]);
    xnor xnor2(n2, a[2], b[2]);
    xnor xnor3(n3, a[3], b[3]);
    and and0(out, n0, n1, n2, n3);
endmodule

// Structural (beacuse of the `always` block)
module Comparator2
    (
        input[1:0] A, B,
        output reg Equals // (ports are declared as wires by default).
    );

    wire n0, n1, outw;
    xnor xnor0(n0, A[0], B[0]);
    xnor xnor1(n1, A[1], B[1]);
    and and0(outw, n0, n1);

    // always combinational block
    always @(outw) begin
        // RTL (nonblocking assignment `<=`)
        // it doesnt block the evaluation of other assignments
        Equals <= outw; // nets appearing on the LHS of assignment statements inside of always blocks
        // must be declared as type reg.
        // However declaring a reg in Verilog does not necessarily mean that a hardware register is described by the code.
        // That usually involves the use of a clock signal: `always @(posedge clk) begin`
        // https://stackoverflow.com/questions/29628469/how-to-store-input-into-reg-from-wire-in-verilog
    end

endmodule // Comparator2

// Dataflow
module comparator
    #(parameter WIDTH=4)(A, B, Y);
    input[BW-1:0] A, B;
    output Y;

    // continous assignment
    assign Y = &((A ~^ B));
endmodule // comparator

module comparator
    (
        input x,
        input y,
        output z
    );

    assign z = (~x & ~y) | (x & y);
endmodule

// Behavioral
module comparator
    #(parameter WIDTH=4)(A, B, Y);
    input[WIDTH-1:0] A, B;
    output Y;

    integer N;
    reg Y;

    // procedural (blocking) assignment
    always @(A or B)
        begin : COMPARE
            Y = 0;
            if (A == B)
                Y = 1;
        end // COMPARE
endmodule // comparator
