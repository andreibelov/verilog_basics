/***************************************************
* File: tb_loops.v
* Author: Andrei Belov
* Class: EE 271
* Module: Adder_tb
* Description: simple test block
****************************************************/

`timescale 1ns/1ps  // set timescale to nanoseconds, ps precision
module Adder_tb(); //  no sensitivity list!
    // signal declarations
    reg[3:0] a_tb, b_tb;  // data input stimulus
    reg Cin;               // data input stimulus
    wire[3:0] y_tb;       // data output response
    wire Co_tb;            // data output response
    reg[3:0] expected;    // expected sum result

    // DUT instantiation
    add4 DUT(.A(a_tb), .B(b_tb), .Cin(Cin), .Sum(y_tb), .Cout(Co_tb));

    integer i, j, k;
    //Adder Testbench, continued
    //Test stimulus generation
    initial
        begin // loop over number of a inputs
            // possible
            for(i = 0; i<16; i = i+1) begin
                a_tb <= i;
                for(j=0; j<16; j = j+1) begin
                    b_tb <= j;
                    for (k=0; k<2; k=k+1) begin
                        Cin <= k;
                        #(10);
                        expected <= a_tb + b_tb + Cin;
                        if (y_tb !== a_tb + b_tb + Cin)
                            begin
                                $display("Error - sum is wrong");
                                $stop;
                            end
                    end
                end
            end
        end
endmodule
