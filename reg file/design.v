module regfile (
    input        clk,
    input        we,
    input  [2:0] waddr,
    input  [7:0] wdata,
    input  [2:0] raddr1,
    input  [2:0] raddr2,
    output [7:0] rdata1,
    output [7:0] rdata2
);
    reg [7:0] mem [0:7];

    always @(posedge clk) begin
        if (we)
            mem[waddr] <= wdata;
    end

    assign rdata1 = mem[raddr1];
    assign rdata2 = mem[raddr2];
endmodule
