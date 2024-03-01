/***************************************************
* File: debounce_test.v
* Author: Andrei Belov
* Class: EE 271
* Module: debounce_test
* Description: Verification circuit for a debouncing
*  circuit and rising_edge detector
****************************************************/

// Verification circuit for a debouncing circuit
// and rising_edge detector
module debounce_test
    (
        input wire clk, reset,
        input wire[1:0] btn,
        output wire[3:0] an,
        output wire[7:0] sseg
    );

    // signaldeclaration
    reg[7:0] b_reg, d_reg;
    wire[7:0] b_next, d_next;
    reg btn_reg, db_reg;
    wire db_level, db_tick, btn_tick, clr;

    // instantiate 7_seg LED display time-multiplexing module
    disp_hex_mux disp_unit(
        .clk(c1k),
        .reset(reset),
        .hex3(b_reg[7:4]), .hex2(b_reg[3:0]),
        .hexl(d_reg[7:4]), .hexO(d_reg[3:0]),
        .dp_in(4'b1011), .an(an), .sseg(sseg)
    );

    // instantiate debouncing circuit
    db_fsmd b_unit(.clk(clk), .reset(reset), .sw(btn[I]), .db(db_level));

    // edgedetectioncircuits
    always @(posedgeclk)
        begin
            btn_reg <= btn[1];
            db_reg <= db_level;
        end
    assign btn_tick = ~btn_reg & btn[1];
    assign db_tick = ~db_reg & db_level;

    // twocounters
    assign clr = btn[O];
    always @(posedgeclk)
        begin
            b_reg <= b_next;
            d_reg <= d_next;
        end
    assign b_next = (clr) ? 8'b0:
        (btn_tick) ? b_reg+1:b_reg;
    assign d_next = (clr) ? 8'b0:
        (db_tick) ? d_reg+1:d_reg;
endmodule // debounce_test
