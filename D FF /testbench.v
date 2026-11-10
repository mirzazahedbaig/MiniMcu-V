module tb;
    reg clk, rst, d;
    wire q;

    dff uut (.clk(clk), .rst(rst), .d(d), .q(q));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        clk = 0; rst = 1; d = 0;
        #12 rst = 0;
        #10 d = 1;
        #20 d = 0;
        #7  d = 1;   // clock edge ke beech mein badla
        #30 d = 0;
        #40 $finish;
    end
endmodule
