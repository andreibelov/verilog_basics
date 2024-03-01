/***************************************************
* File: mux_sim.v
* Author: Benjamin Morgan
* Class: EE 271
* Module: mux_sim
* Description: The top level module for the
* testbench tutorial
****************************************************/

module mux_sim(LEDR, SW);
    output[0:0] LEDR;
    input[2:0] SW;

    mux my_mux(
        .f(LEDR[0]),
        .in0(SW[0]),
        .in1(SW[1]),
        .sel(SW[2])
    );
endmodule // mux_sim
