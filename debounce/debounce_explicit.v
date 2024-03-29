/***************************************************
* File: debounce_explicit.v
* Author: Andrei Belov
* Class: EE 271
* Module: debounce_explicit
* Description: debouncing FSM
****************************************************/

// Listing 6.1
module debounce_explicit
    (
        input wire clk, reset,
        input wire sw,
        output reg db_level, db_tick
    );

    // symbolic state declaration
    localparam [1:0]
        zero = 2'b00,
        wait0 = 2'b01,
        one = 2'b10,
        wait1 = 2'b11;

    // number of counter bits (2^N * 20ns = 40ms)
    localparam N = 21;

    // signal declaration
    reg[1:0] state_reg, state_next;
    reg[N-1:0] q_reg;
    wire[N-1:0] q_next;
    wire q_zero;
    reg q_load, q_dec;

    // body
    // fsmd state & data registers
    always @(posedge clk, posedge reset)
        if (reset)
            begin
                state_reg <= zero;
                q_reg <= 0;
            end
        else
            begin
                state_reg <= state_next;
                q_reg <= q_next;
            end

    // FSMD data path (counter) next-state logic
    assign q_next = (q_load) ? {N{1'b1}}:   // load 1..1
        (q_dec) ? q_reg-1:   // decrement
            q_reg;
    // status signal
    assign q_zero = (q_next == 0);

    // FSMD control path next-state logic
    always @*
        begin
            state_next = state_reg;  // default state: the same
            q_load = 1'b0;           // default output: 0
            q_dec = 1'b0;            // default output: 0
            db_tick = 1'b0;          // default output: 0
            case (state_reg)
                zero:
                    begin
                        db_level = 1'b0;
                        if (sw)
                            begin
                                state_next = wait1;
                                q_load = 1'b1;
                            end
                    end
                wait1:
                    begin
                        db_level = 1'b0;
                        if (sw)
                            begin
                                q_dec = 1'b1;
                                if (q_zero)
                                    begin
                                        state_next = one;
                                        db_tick = 1'b1;
                                    end
                            end
                        else // sw==0
                            state_next = zero;
                    end
                one:
                    begin
                        db_level = 1'b1;
                        if (~sw)
                            begin
                                state_next = wait0;
                                q_load = 1'b1;
                            end
                    end
                wait0:
                    begin
                        db_level = 1'b1;
                        if (~sw)
                            begin
                                q_dec = 1'b1;
                                if (q_zero)
                                    state_next = zero;
                            end
                        else // sw==1
                            state_next = one;
                    end
                default: state_next = zero;
            endcase
        end

endmodule