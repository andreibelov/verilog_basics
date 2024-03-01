/***************************************************
* File: bus_me.v
* Author: Andrei Belov
* Class: EE 271
* Module: BusMe
* Description: Manipulating Buses
****************************************************/

// Joining and splitting
module BusMe
    (
        input wire[4:0] A,
        input wire[2:0] B,
        output wire X, Y,
        output wire[5:0] Dout
    );
    assign Dout = {B, A[2:0]};
    assign X = A[3];
    assign Y = A[4];
endmodule
