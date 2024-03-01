/***************************************************
* File: rom.v
* Author: Andrei Belov
* Class: EE 271
* Module: ROM
* Description: ROM circuit
****************************************************/

module ROM
    #(
        parameter Data_width = 8,  //# of bits in word
                  Addr_width = 3  // # of address bits
    )
    (  //ports
        input wire clk,
        input wire [Addr_width-1:0] addr,
        output wire [Data_width-1:0] data
    );

    // signal declarations
    reg [Data_width-1:0] rom_data, data_reg;

    // body
    always @(posedge clk)  // output register
        data_reg <= rom_data;

    always @*
        case(addr)  // lookup table
            3'b000:  rom_data = 8'b1000_0000;
            3'b001:  rom_data = 8'b1010_1010;
            3'b010:  rom_data = 8'b0101_0101;
            3'b011:  rom_data = 8'b1000_0011;
            3'b100:  rom_data = 8'b0000_0000;
            3'b101:  rom_data = 8'b1001_1001;
            3'b110:  rom_data = 8'b1000_0001;
            3'b111:  rom_data = 8'b1111_0000;
        endcase

    assign data = data_reg;
endmodule // ROM
