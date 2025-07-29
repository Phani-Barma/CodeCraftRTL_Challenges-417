module EdgeHighlighter(
    input clk,
    input rst,
    input signal_in,
    output reg rising_edge,
    output reg falling_edge
);
    reg prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev <= 0;
            rising_edge <= 0;
            falling_edge <= 0;
        end else begin
            rising_edge <= (~prev & signal_in);
            falling_edge <= (prev & ~signal_in);
            prev <= signal_in;
        end
    end
endmodule
