/***************************************************
* File: mux.v
* Author: Benjamin Morgan
* Class: EE 271
* Module: mux
* Description: A simple 2 to 1 multiplexor circuit
****************************************************/

module mux(f, in0, in1, sel);
    output f;
    input in0, in1, sel;
    assign f = (in0 & ~sel) | (in1 & sel);
endmodule