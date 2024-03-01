/***************************************************
* File: gates_proc.v
* Author: Andrei Belov
* Class: EE 271
* Module: always_combo
* Description: Procedural gates generation
****************************************************/

// Procedural
module always_combo
    (
        input A, B, C, D,
        output reg Y
    );

    always @(A or B or C or D)
        begin
            if ((C == 1) && (D == 1))
                Y <= 0; // blocking assignment could be used
                // but blocking and non-blocking assignments
                // can not be mixed in the same procedure
            else if ((A == 1) || (B == 1))
                Y <= 1;
            else
                Y <= 0;
        end
endmodule // always_combo
