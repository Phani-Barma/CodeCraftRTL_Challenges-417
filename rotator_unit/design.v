module RotatorUnit(
    input clk,
    input rst,
    input dir, // 0: Left, 1: Right
    input [7:0] data_in,
    output reg [7:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= data_in;
        else if (dir)
            data_out <= {data_out[0], data_out[7:1]}; // Right rotate
        else
            data_out <= {data_out[6:0], data_out[7]}; // Left rotate
    end
endmodule
