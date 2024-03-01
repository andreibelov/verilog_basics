/***************************************************
* File: mux2.v
* Author: Andrei Belov
* Class: EE 271
* Module: mux2
* Description: A simple 2 to 1 multiplexor circuit
****************************************************/

// from the simulation you'll see that the output changes instantaneously with input changes
// The delay must be specified as part of the circuit description.
// It is important to add delay to circuit elements to get a realistic simulation,
// and in some cases to get correct
module mux2(in0, in1, select, out);
    input in0, in1, select;
    output out;
    wire s0, w0, w1;
    not
    #1(s0, select);
    and
    #1(w0, s0, in0),(w1, select, in1);
    or
    #1(out, w0, w1);
endmodule // mux2
