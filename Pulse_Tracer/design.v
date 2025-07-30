module PulseTracer(
    input clk,
    input rst,
    input noisy_in,
    output reg clean_pulse
);
    reg sync1, sync2, prev;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sync1 <= 0;
            sync2 <= 0;
            prev <= 0;
            clean_pulse <= 0;
        end else begin
            sync1 <= noisy_in;
            sync2 <= sync1;
            clean_pulse <= (~prev & sync2);
            prev <= sync2;
        end
    end
endmodule
