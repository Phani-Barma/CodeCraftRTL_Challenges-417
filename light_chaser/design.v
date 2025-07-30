module LightChaser(
    input clk,
    input rst,
    input enable,
    output reg [7:0] leds
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            leds <= 8'b00000001;
        else if (enable)
            leds <= {leds[6:0], leds[7]};
    end
endmodule
