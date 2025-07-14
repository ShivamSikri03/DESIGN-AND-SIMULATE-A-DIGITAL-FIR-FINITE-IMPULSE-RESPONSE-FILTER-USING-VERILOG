`timescale 1ns/1ps
module tb_fir;

    reg clk, reset;
    reg [7:0] x_in;
    wire [15:0] y_out;

    simple_fir fir (
        .clk(clk),
        .reset(reset),
        .x_in(x_in),
        .y_out(y_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("filter.vcd");
        $dumpvars(0,tb_fir);
        $display("Time | x_in | y_out");
        $monitor("%4t | %4d | %5d", $time, x_in, y_out);

        clk = 0;
        reset = 1;
        x_in = 0;

        #10 reset = 0;

        // Send input sequence
        x_in = 1; #10;
        x_in = 2; #10;
        x_in = 3; #10;
        x_in = 4; #10;
        x_in = 5; #10;

        x_in = 0; #50;
        $finish;
    end

endmodule
