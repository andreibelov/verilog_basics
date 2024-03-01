module gates // module and name
    (
        input A, B, C, D,
        input[3:0] vA, vB,
        output W, U, X, Y, Z,
        output[3:0] vX, vY
    );

    assign W = A & B;    // scalar AND Gate
    assign U = ~(A | B); // scalar NOR Gate
    assign X = C ^ D;    // scalar XOR Gate
    assign Y = C ~^ D;   // scalar XNOR Gate
    assign Z = (A & B) | (C & D); // AND-OR gates
    assign vX = vA & vB; // Vector bitwise AND
    assign vY = vA | vB; // Vector bitwise OR

endmodule //gates
