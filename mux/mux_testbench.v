/***************************************************
* File: mux_testbench.v
* Author: Benjamin Morgan
* Class: EE 271
* Module: mux_testbench
* Description: A simple 2 to 1 multiplexor circuit
****************************************************/

module mux_testbench;
    // these are inputs to "circuit under test"
    reg in0, in1, sel;                  // use "reg" not "wire" so can assign a value
    wire f;                             // wires for the outputs of "circuit under test"
    parameter stimDelay = 10;

    mux DUT(f, in0, in1, sel);          // the circuit under test

    initial                             // initial = run at beginning of simulation
        begin                           // begin/end = associate block with initial
            in0 = 0; in1 = 0; sel = 0;
            #(stimDelay) in0 = 1;
            #(stimDelay) in0 = 0; in1 = 1;
            #(stimDelay) in0 = 1;
            #(stimDelay) in0 = 0; in1 = 0; sel = 1;
            #(stimDelay) in0 = 1;
            #(stimDelay) in0 = 0; in1 = 1;
            #(stimDelay) in0 = 1;
            #(stimDelay) sel = 0;
            #40                 // Run for some more time,
                $stop;              // and stop.
            $finish;            // Terminate simulation.
        end
endmodule
