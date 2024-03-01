// Data Register File
// 4 x 8
module regFile
    #(
        parameter Dwidth=8, // #bits in word
                  Awidth=2  // #address bits
    )
    (
        input wire clk, wren,
        input wire[(Dwidth1):0] wdata,
        input wire[(Awidth1):0] waddr, raddr,
        output wire[(Dwidth-1):0] rdata
    );
    // Signal Declaration
    reg[Dwidth-1:0] array_reg[2**Awidth-1:0];

    always @(posedge clk)
        if (wren)  // synchronous enable
            array_reg[waddr] <= wdata;
    assign rdata = array_reg[raddr];
endmodule
