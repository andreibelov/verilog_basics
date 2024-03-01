/***************************************************
* File: tri_state_bus.v
* Author: Andrei Belov
* Class: EE 271
* Module: Tri
* Description: Tri-state Buses
****************************************************/

// Tri-state bus
//
module Tri
    (
        input wire[3:0] Dout,
        input wire OE,
        output wire[3:0] Pinout
    );
    assign Pinout = (OE == 1) ? Dout:(OE == 0) ? 4'bz:4'bx;
endmodule

// Tri-state bus
//
module Tri2
    (
        input wire[3:0] Dout,
        input wire OE,
        output wire[3:0] Pinout
    );
    assign Pinout = OE ? Dout : 4'bz;
endmodule
