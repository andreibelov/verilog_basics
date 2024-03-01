/***************************************************
* File: and_2in.v
* Author: Andrei Belov
* Class: EE 271
* Module: and_2in
* Description: two input AND gate design
****************************************************/

module and_2in(A, B, Y);    // Declare the design module.
    input A, B;             // Declare the design inputs
    output Y;               // and output.
    wire Y;                 // Declare the output as net.
    assign Y = A & B;       // Realize the 2 input AND gate.
endmodule                   // The end of design.
