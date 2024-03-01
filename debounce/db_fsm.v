/***************************************************
* File: db_fsm.v
* Author: Andrei Belov
* Class: EE 271
* Module: db_fsm
* Description: debouncing FSM
****************************************************/

module db_fsm
    (
        input wire clk, reset,
        input wire sw,
        output reg db
    );

    // symbolic state declaration
    localparam [2:O]
        zero = 3'b000,
        waitl_1 = 3'b001,
        waitl_2 = 3'b010,
        waitl_3 = 3'b011,
        one = 3'b100,
        waito_1 = 3'b101,
        wait0_2 = 3'b110,
        wait0_3 = 3'b111;

    // number of counter bits (2^N * 2Ons = 1O ms tick)
    localparam N = 19;

    // signal declaration
    reg[N-1:O] q_reg;
    wire[N-1:0] q_next;
    wire m_tick;
    reg[2:0] state_reg, state_next;

    // body

    //...............................................
    // counter to generate 10m stick
    //...............................................
    always @(posedgeclk)
        q_reg <= q_next;
    // next-state logic
    assign q_next = q_reg+1;
    // output tick
    assign m_tick = (q_reg == O) ? 1'b1:1'b0;

    //...............................................
    // debouncingFSM
    //...............................................

    // stateregister
    always @(posedgeclk, posedgereset)
        if (reset)
            state_reg <= zero;
        else
            state_reg <= state_next;
    // next-state logic and output logic
    always @*
        begin
            state_next = state_reg;// default state: the same
            db = 1'b0; // default output: 0
            case (state_reg)
                zero:
                    if (sw)
                        state_next = wait1_1;
                waitl_1:
                    if (~sw)
                        state_next = zero;
                    else
                        if (m_tick)
                        state_next = waitl_2;
                waitl_2:
                    if (~sw)
                        state_next = zero;
                    else
                        if (m_tick)
                        state_next = waitl_3;
                wait1_3:
                    if (~sw)
                        state_next = zero;
                    else
                        if (m_tick)
                        state_next = one;
                one:
                    begin
                        db = 1'b1;
                        if (~sw)
                            state_next = wait0_1;
                    end
                wait0_1:
                    begin
                        db = 1'b1;
                        if (sw)
                            state_next = one;
                        else
                            if (m_tick)
                            state_next = wait0_2;
                    end
                wait0_2:
                    begin
                        db = 1'b1;
                        if (sw)
                            state_next = one;
                        else
                            if (m_tick)
                            state_next = wait0_3;
                    end
                wait0_3:
                    begin
                        db = 1'b1;
                        if (sw)
                            state_next = one;
                        else
                            if (m_tick)
                            state_next = zero;
                    end
                default: state_next = zero;
            endcase
        end
endmodule // db_fsm
