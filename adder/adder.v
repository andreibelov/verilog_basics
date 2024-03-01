/***************************************************
* File: adder.v
* Author: Andrei Belov
* Class: EE 271
* Module: adder
* Description: adder
****************************************************/

// Dataflow
module adder
    #(parameter BW=2)
    (
        input logic[BW-1:0] A,
        input logic[BW-1:0] B,
        input logic clk,
        output logic[BW-1:0] Sum
    );

    logic[BW-1:0] result_ref;

    assign Sum = result_ref;

    always @(posedge clk) begin
        result_ref <= A+B;
    end

endmodule : adder