/***************************************************
* File: data_reg.v
* Author: Andrei Belov
* Class: EE 271
* Module: data_reg
* Description: Data Register circuit
****************************************************/

// Data Register
//
module data_reg
    (
        input wire[3:0] d,
        input wire clk, reset, load,
        output reg[3:0] q
    );
    always @(posedge clk or negedge reset)
        begin
            if (!reset)  // asynchronous reset
                q <= 0;
            else if (load == 1)
                q <= d;
        end
endmodule // data_reg
