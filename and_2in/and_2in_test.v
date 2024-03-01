/***************************************************
* File: and_2in_test.v
* Author: Andrei Belov
* Class: EE 271
* Module: and_2in_test
* Description: The test bench for the AND gate design
****************************************************/

// `include "and_2in.v"    // This is the design file.
`timescale 1ns/100ps    // Time base is in nano seconds and its resolution is in pico seconds.
module and_2in_test;   // Declare the test module.
    reg A, in;         // Declare inputs as registers since we need to hold the values.
    wire out;          // Declare output(s) as wire (meaning net) since we need to
    // inter-connect other submodules, should they exist.

    and_2in u1(         // Call the design module u1 stands for the first instantiation.
        .A(A),          // Connect ports by name.
        .B(in),
        .Y(out)
    );

    initial
        begin
            A = 0; in = 0;      // Apply stimulus at time 0.
            #20 A = 0; in = 1;  // Change inputs at time 20 ns,
            #20 A = 1; in = 0;  // 40 ns, and
            #20 A = 1; in = 1;  // 60 ns.
            #40 $stop;          // Run for some more time and stop.
            $finish;            // Terminate simulation.
        end
endmodule // and_2in_test
