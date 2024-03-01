/***************************************************
* File: angle_fsm.v
* Author: Andrei Belov
* Class: EE 271
* Module: AngleFSM
* Description:  Simple angle finite state machine
****************************************************/

module AngleFSM
    #(  // Binary encoding of states
        parameter State_width=3,
                  An0=3'b000,
                  An45=3'b001,
                  An90=3'b010,
                  An135=3'b011,
                  An180=3'b100,
                  An225=3'b101,
                  An270=3'b110,
                  An315=3'b111)
    (  //ports
        input wire clk, reset, MoveCW, MoveCCW,
        input wire[(State_width-1):0] PhysicalPosition,
        output wire[(State_width-1):0] DesiredPosition, PosError
    );
    reg[(State_width-1):0] CurrentState, NextState;

    // body of FSM is case statement
    // Next State Logic

    always @(MoveCW or MoveCCW or PhysicalPosition or CurrentState)
        begin : Combinational1
            case (CurrentState)
                An0:
                    if (MoveCW == 1)
                        NextState = An45;
                    else if (MoveCCW == 1)
                        NextState = An315;
                    else
                        NextState = An0;
                An45:
                    if (MoveCW == 1)
                        NextState = An90;
                    else if (MoveCCW == 1)
                        NextState = An0;
                    else
                        NextState = An45;

                //states An90 to An270 here
                // ...

                An315:
                    if (MoveCW == 1)
                        NextState = An0;
                    else if (MoveCCW == 1)
                        NextState = An270;
                    else
                        NextState = An315;
                default:
                    NextState = PhysicalPosition;
            endcase
        end

    // Current State Register
    always @(posedge clk or negedge reset)
        begin : Sequential
            if (!reset)
                CurrentState = PhysicalPosition;
            else
                CurrentState = NextState;
        end

    // Output Logic
    // Moore Outputs
    assign DesiredPosition = CurrentState;
    // Mealy Outputs
    assign PosError = DesiredPosition-PhysicalPosition;

endmodule // AngleFSM
