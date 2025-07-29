module SeqCheck(
    input clk,
    input rst,
    input signal_in,
    output reg detected
);
    reg [2:0] shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift <= 0;
            detected <= 0;
        end else begin
            shift <= {shift[1:0], signal_in};
            detected <= (shift == 3'b011 && signal_in); // Rising edge pattern
        end
    end
endmodule
