/***************************************************
* File: counter_tb.v
* Author: Andrei Belov
* Class: EE 271
* Module: Counter_tb
* Description: A simple Binary Counter testbench
****************************************************/

`timescale 1ns/1ps   // set timescale
// to nanoseconds, ps precision //Testbench entity declaration
module Counter_tb();  // top level, no external ports //constant declarations
    parameter delay = 10;  //ns  defines the wait period.
    localparam n = 4;  // width of counter in bits
    localparam T = 20;  // clock period

    //  signal declarations
    reg clock = 0; //clock if needed, from generator model
    reg reset = 0;    // reset if needed
    reg[n-1:0] data_tb = 4'b0000;  // data input stimulus
    reg load = 0, en = 0;  // input stimulus
    wire[3:0] q;  // output to check
    reg[n-1:0] checkcount = 4'b0000; // variable to compare to count

    // Component Instances
    // instantiate the device under test
    Counter DUT(     // Device under Test
        // Inputs
        .d(data_tb),
        .clk(clock),
        .reset(reset),
        .load(load),
        .en(en),
        // Outputs
        .q(q)
    );

    // External Device Simulation Processes clock driver
    always
        begin
            clock = 1'b1;
            #(T/2);
            clock = 1'b0;
            #(T/2);
        end

    // reset driver
    initial
        begin
            reset = 1'b1;
            #(T/2);
            reset = 1'b0;
        end

    // Test Process
    initial    // test generation process
        begin
            @(negedge reset) // wait for reset inactive
                @(negedge clock) // wait for one clock
                // Test load
                load = 1'b1;
            en = 1'b0;
            data_tb = 4'b1010;
            @(negedge clock) // wait for one clock
                if (q != 4'b1010)
                    $display("Load failure %b", q);

            // test count
            checkcount = 4'b1010;  // compare variable
            load = 1'b0;
            en = 1'b1;
            repeat (2 ** n)
                begin
                    checkcount = checkcount+1;   // count
                    @(negedge clock) // wait for one clock
                        if (q != checkcount)
                            $display("Count failure at time %g/t at count %b", $time, q);
                end
            $stop;   // end simulation
        end
endmodule
