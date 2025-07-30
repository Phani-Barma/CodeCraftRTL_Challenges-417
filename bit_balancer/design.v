module BitBalancer (
    input clk,
    input rst,
    input [7:0] data_in,
    input load,
    output reg [3:0] count
);
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 0;
        else if (load) begin
            count <= 0;
            for (i = 0; i < 8; i = i + 1)
                count <= count + data_in[i];
        end
    end
endmodule
