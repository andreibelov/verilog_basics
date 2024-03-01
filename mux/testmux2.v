/***************************************************
* File: testmux2.v
* Author: Andrei Belov
* Class: EE 271
* Module: testmux2
* Description:
*   Test bench for 2-input multiplexor.
*   Tests all input combinations.
****************************************************/

module testmux2;
    reg[2:0] c;
    wire f;
    reg expected;
    mux2 myMux(.select(c[2]), .in0(c[0]), .in1(c[1]), .out(f));
    initial
        begin
            #0 c = 3'b000; expected = 1'b0;
            repeat (7)
                begin
                    #10
                        c = c+3'b001;
                    if (c[2]) expected = c[1]; else expected = c[0];
                end
            #10 $stop;
        end
    initial
        begin
            $display("Test of mux2.");
            $monitor("[select in1 in0]=%b out=%b expected=%b time=%d",
                c, f, expected, $time);
        end
endmodule // testmux2
