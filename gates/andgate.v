/***************************************************
* File: andgate.v
* Author: Andrei Belov
* Class: EE 271
* Module: andgate
* Description:  Simple AND gate circuit
****************************************************/

// And gate
//
module andgate(x1, x2, f);
    input x1, x2;
    output f;
    assign f = x1 & x2;
endmodule // andgate
