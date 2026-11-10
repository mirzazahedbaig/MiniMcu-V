module tb;
    reg clk, we;
    reg [2:0] waddr, raddr1, raddr2;
    reg [7:0] wdata;
    wire [7:0] rdata1, rdata2;

    regfile uut (.clk(clk), .we(we), .waddr(waddr), .wdata(wdata),
                 .raddr1(raddr1), .raddr2(raddr2),
                 .rdata1(rdata1), .rdata2(rdata2));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        clk = 0; we = 0; waddr = 0; wdata = 0; raddr1 = 0; raddr2 = 0;

        #12 we = 1; waddr = 3'd1; wdata = 8'd10;   // R1 = 10
        #10 waddr = 3'd2; wdata = 8'd20;           // R2 = 20
        #10 waddr = 3'd3; wdata = 8'd30;           // R3 = 30
        #10 we = 0;

        #10 raddr1 = 3'd1; raddr2 = 3'd2;          // 10 aur 20 aana chahiye
        #20 raddr1 = 3'd3; raddr2 = 3'd1;          // 30 aur 10
        #20 $finish;
    end
endmodule
