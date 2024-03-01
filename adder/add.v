/***************************************************
* File: add.v
* Author: Andrei Belov
* Class: EE 271
* Module: add
* Description: adder
****************************************************/

// Dataflow
module add
    #(parameter BW=4)
    (
        // Input Port(s)
        input[BW-1:0] A, B, input Cin,
        // Output Port(s)
        output[BW-1:0] Sum, output Cout
    );
    assign {Cout, Sum} = A+B+Cin;
endmodule // add