`timescale 1ns/1ps
module tb_PulseTracer;

    reg clk, rst_n, noisy_signal;
    wire pulse_out;

    PulseTracer uut (
        .clk(clk),
        .rst_n(rst_n),
        .noisy_signal(noisy_signal),
        .pulse_out(pulse_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 100MHz clock
    end

    initial begin
        rst_n = 0;
        noisy_signal = 0;
        #15;
        rst_n = 1;

        // Inject noisy input
        #10 noisy_signal = 1;
        #5  noisy_signal = 0;
        #5  noisy_signal = 1; // clean rising edge
        #10 noisy_signal = 0;

        // Another valid pulse
        #20 noisy_signal = 1;
        #10 noisy_signal = 0;

        #50 $finish;
    end

    initial begin
        $dumpfile("pulse_tracer.vcd");
        $dumpvars(0, tb_PulseTracer);
    end

endmodule
