module DPRAM
    #(
        parameter Data_width=8,  //# of bits in word
                  Addr_width=10  // # of address bits
    )
    (  //ports
        input wire clk,
        input wire we,
        input wire[(Addr_width-1):0] w_addr, r_addr,
        input wire[(Data_width-1):0] d,
        output wire[(Data_width-1):0] q
    );

    // signal declarations
    reg[Data_width-1:0] ram[2**Addr_width-1:0];
    // 2 dimensional array for RAM storage
    reg[Data_width-1:0] data_reg;
    // read output reg.
    // RAM initialization from an external file
    initial
        $readmemh("initalRAM.txt", ram);

    // body
    //  write operation
    always @(posedge clk)
        begin
            if (we)
                ram[w_addr] <= d;    // write data
            data_reg <= ram[r_addr]; // read data to reg
        end

    // read operation
    assign q = data_reg;

endmodule

