module tb;
    reg clk;
    reg rst;
    wire [3:0] count;

    counter uut (.clk(clk), .rst(rst), .count(count));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        clk = 0;
        rst = 1;
        #12 rst = 0;
        #200 $finish;
    end
endmodule
