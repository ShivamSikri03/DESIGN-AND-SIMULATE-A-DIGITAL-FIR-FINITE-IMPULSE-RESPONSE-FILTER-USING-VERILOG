module fir_filter (
    input clk,
    input reset,
    input [7:0] x_in,           
    output reg [15:0] y_out     
);

    reg [7:0] x1, x2;           // Delay registers

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x1 <= 0;
            x2 <= 0;
            y_out <= 0;
        end else begin
            // Shift inputs
            x2 <= x1;
            x1 <= x_in;

            // output: y = 3*x[n] + 2*x[n-1] + 1*x[n-2]
            y_out <= (3 * x_in) + (2 * x1) + (1 * x2);
        end
    end
endmodule
