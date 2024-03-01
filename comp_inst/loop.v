/***************************************************
* File: loop.v
* Author: Andrei Belov
* Class: EE 271
* Module: scalarAnd
* Description: And scalar g with vector A
****************************************************/

// loops can be used to generate data or test patterns
// There are several looping constructs within Verilog, including:
//      repeat
//      while
//      forever
//      for
module scalarAnd
    #(parameter N=4)
    (input g,
        input[N-1:0] a,
        output[N-1:0] y);

    reg[N-1:0] tmp, y;
    integer i;   // loop index, not signal

    always @(a or g)
        begin
            // The for loop statement is written and behaves just like it does in C, as is the while loop.
            // The forever loop is explicitly an infinite loop.
            // The repeat statement executes a statement or block of statements a fixed number of times.
            for (i = 0; i < N; i = i+1)
                begin
                    tmp[i] = a[i] & g;
                end
            y = tmp;
        end
endmodule