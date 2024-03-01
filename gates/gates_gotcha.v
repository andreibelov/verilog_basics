/***************************************************
* File: gates_gotcha.v
* Author: Andrei Belov
* Class: EE 271
* Module: always_combo
* Description: missing final else block
*              the latch is inferred
****************************************************/


// Procedural gates gotcha
//
module always_combo
    (
        input A, B, C, D,
        output reg Y
    );

    always @(A or B or C or D)
        begin
            if ((C == 1) && (D == 1))
                Y <= 0;
            else if ((A == 1) || (B == 1))
                Y <= 1;
            // missing final else block
            // the latch is inferred
        end
endmodule // always_combo
