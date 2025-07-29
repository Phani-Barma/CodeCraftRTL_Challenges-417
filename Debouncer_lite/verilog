module DebouncerLite(
    input clk,
    input rst,
    input noisy_in,
    output reg clean_out
);
    reg [2:0] shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift <= 3'b000;
            clean_out <= 0;
        end else begin
            shift <= {shift[1:0], noisy_in};
            if (shift == 3'b111)
                clean_out <= 1;
            else if (shift == 3'b000)
                clean_out <= 0;
        end
    end
endmodule
