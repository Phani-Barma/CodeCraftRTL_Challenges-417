module EvenOddFSM(
    input clk,
    input rst,
    input [3:0] in_data,
    input valid,
    output reg even
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            even <= 0;
        else if (valid)
            even <= ~in_data[0]; // Check LSB: 0 => even, 1 => odd
    end
endmodule
