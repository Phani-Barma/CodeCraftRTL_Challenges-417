module NibbleSwapper(
    input clk,
    input rst,
    input [7:0] data_in,
    input swap,
    output reg [7:0] data_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            data_out <= 8'd0;
        else if (swap)
            data_out <= {data_in[3:0], data_in[7:4]};
        else
            data_out <= data_in;
    end
endmodule
