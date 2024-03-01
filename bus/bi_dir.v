/***************************************************
* File: bi_dir.v
* Author: Andrei Belov
* Class: EE 271
* Module: BiDir
* Description: Bi-directional bus
****************************************************/

module BiDir
    (
        output wire[3:0] Din,
        input wire[3:0] Dout,
        input wire OE,
        inout wire[3:0] IOpin
    );
    assign Din = IOpin;
    assign IOpin = (OE == 1) ? Dout:(OE == 0) ? 4'bz:4'bx;
endmodule
