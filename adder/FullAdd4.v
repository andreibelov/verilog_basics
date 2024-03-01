/***************************************************
* File: FullAdd4.v
* Author: Andrei Belov
* Class: EE 271
* Module: FullAdd4
* Description: 4 bit full adder
****************************************************/

module FullAdd4( A,B,Cin,Sum,Cout);

    // Parameter Declaration(s)
    parameter BW = 4;
    // https://stackoverflow.com/questions/65757803/
    parameter PADDING = { BW-1{1'b0} }; // Define padding as a parameter
    parameter ZERO = { BW{1'b0} };      // all zeroes
    parameter UNO = { PADDING, 1'b1 };  // all zeroes except LSB

    // Input Port(s)
    input [BW-1:0] A, B;
    input Cin;

    // Output Port(s)
    output [BW-1:0] Sum;
    output Cout;

    // Registers
    reg [BW:0] result_ref = { PADDING, 1'b0 };

    assign {Cout, Sum} = result_ref;

    always @(A,B,Cin) begin
        result_ref <= A + B + { PADDING, Cin };
    end

endmodule // FullAdd4

