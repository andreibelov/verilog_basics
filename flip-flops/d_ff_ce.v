// D Flip Flops with clock enable
//
module DFFe(d, clk, ce, clr, reset, qlda, qlds);
    input d, clk, ce, clr, reset;
    output reg qld, qlda, qlds;

    always @(posedge clk)   //
        begin // FF with sync reset & clk enable
            if (reset == 1) qlds <= 0;
            else if (ce == 1) qlds <= d;
        end

    always @(posedge clk or posedge clr)
        begin // FF with async reset & clk enable
            if (clr == 1) qlda <= 0;
            else if (ce == 1) qlda <= d;
        end

endmodule