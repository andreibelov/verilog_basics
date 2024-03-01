/***************************************************
* File: gates_reduce.v
* Author: Andrei Belov
* Class: EE 271
* Module: gates
* Description: Reduction gates
****************************************************/

module gates // module and name
    (
        input[3:0] vA, vB, vC, vD,
        output W, U, X, Y, Z
    );
    assign W = & vA; // Vector Reduction AND Gate
    assign U = ~| vB; // Vector reduction NOR Gate
    assign X = ^ vD; // Vector reduction XOR Gate
    assign Y = | vA & vB; // bitwise or reduction?
    assign Z = | (vA & vB); // bitwise AND reduction OR
endmodule // gates
