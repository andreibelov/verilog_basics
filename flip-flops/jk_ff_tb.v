/***************************************************
* File: jk_ff_tb.v
* Author: Andrei Belov
* Class: EE 271
* Module: tb_jk
* Description: simple jk flip-flop testbench
****************************************************/

`timescale 1ns/100ps    // Time base is in nano seconds and its
// resolution is in pico seconds.
module tb_jk;
    reg j, k, clk;      // Declare inputs as registers since we need to hold the values.
    wire q;             // Declare output(s) as wire (meaning net) since we need to inter-connect other submodules.

    always
        #10 clk = ~clk;
    initial
        clk = 0;

    jk_ff jk0(         // Call the design module jk0 stands for the first instantiation.
        .j(j),          // Connect ports by name.
        .k(k),
        .clk(clk),
        .q(q));

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb_jk);

        // Initialize Inputs
        j <= 0; k <= 0;     // Apply stimulus at time 0.
        #20 j <= 0; k <= 1; // Change inputs at time 20 ns,
        #20 j <= 1; k <= 0; // 40 ns, and
        #20 j <= 1; k <= 1; // 60 ns.
        #40 $stop;          // Run for some more time, and stop.
    end

    initial
        $monitor("j=%0d k=%0d q=%0d", j, k, q);
endmodule
