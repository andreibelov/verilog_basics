/***************************************************
* File: stimulus.v
* Author: Andrei Belov
* Class: EE 271
* Module: stimulus
* Description: Simple comparator stimulus testbench
****************************************************/

`timescale 1ns/1ps
module stimulus;
    // Inputs
    reg x;
    reg y;
    // Outputs
    wire z;
    // Instantiate the Unit Under Test (UUT)
    comparator uut(
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, stimulus);
        // Initialize Inputs
        x = 0;
        y = 0;

        #20 x = 1;
        #20 y = 1;
        #20 y = 0;
        #20 x = 1;
        #40;
        #40 $stop;          // Run for some more time and stop.
        $finish;            // Terminate simulation.
    end

    initial begin
        $monitor("t=%3d x=%d,y=%d,z=%d \n", $time, x, y, z,);
    end

endmodule