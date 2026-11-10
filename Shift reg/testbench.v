module tb;
    reg clk, rst, din;
    wire [7:0] q;

    shift_reg uut (.clk(clk), .rst(rst), .din(din), .q(q));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        clk = 0; rst = 1; din = 0;
        #12 rst = 0;

        // 8 bits bhejo: 1,0,1,1,0,0,1,0  (= 8'b10110010)
        din = 1; #10;
        din = 0; #10;
        din = 1; #10;
        din = 1; #10;
        din = 0; #10;
        din = 0; #10;
        din = 1; #10;
        din = 0; #10;

        #30 $finish;
    end
endmodule
