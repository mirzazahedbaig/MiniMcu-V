module tb;
    reg clk, rst, en;
    reg [7:0] d;
    wire [7:0] q;

    reg8 uut (.clk(clk), .rst(rst), .en(en), .d(d), .q(q));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        clk = 0; rst = 1; en = 0; d = 0;
        #12 rst = 0;
        #10 d = 8'd25; en = 1;   // store hoga
        #10 en = 0;
        #20 d = 8'd99;           // en=0, isliye q nahi badlega
        #10 en = 1;              // ab 99 store hoga
        #10 en = 0;
        #30 $finish;
    end
endmodule
