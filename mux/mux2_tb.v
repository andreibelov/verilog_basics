/***************************************************
* File: mux2_tb.v
* Author: Andrei Belov
* Class: EE 271
* Module: testmux
* Description: testbench for a simple 2 to 1
*   multiplexor circuit
****************************************************/

module testmux;
    reg a, b, s;
    wire f;
    reg expected;

    mux2 myMux(.select(s), .in0(a), .in1(b), .out(f));

    initial
        begin
            #0 s = 0; a = 0; b = 1; expected = 0;
            #10 a = 1; b = 0; expected = 1;
            #10 s = 1; a = 0; b = 1; expected = 1;
            #10 $stop;
        end
    initial
        $monitor(
            "select=%b in0=%b in1=%b out=%b, expected out=%b time=%d",
            s, a, b, f, expected, $time);
endmodule // testmux