module tb;
    reg  [7:0] a, b;
    reg        cin;
    wire [7:0] sum;
    wire       cout;

    adder8 uut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        a = 8'd10;  b = 8'd20;  cin = 0; #10;
        a = 8'd100; b = 8'd55;  cin = 1; #10;
        a = 8'd255; b = 8'd1;   cin = 0; #10;
        a = 8'd200; b = 8'd100; cin = 1; #10;
        a = 8'd50;  b = 8'd50;  cin = 0; #10;

        $finish;
    end
endmodule
