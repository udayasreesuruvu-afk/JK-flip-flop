`timescale 1ns/1ps

module tb_jk_flip_flop;

    reg clk;
    reg rst;
    reg j;
    reg k;

    wire q;
    wire q_bar;

    // Device Under Test
    jk_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    // Generate VCD waveform
    initial begin
        $dumpfile("jk_flip_flop.vcd");
        $dumpvars(0, tb_jk_flip_flop);
    end

    // Test sequence
    initial begin

        $display("==========================================");
        $display("          JK FLIP-FLOP TEST");
        $display("==========================================");

        $display("Time\tJ K\tQ Qbar");
        $display("------------------------------------------");

        // Reset
        rst = 1'b1;
        j = 1'b0;
        k = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // Release reset
        rst = 1'b0;

        // SET: J=1, K=0
        j = 1'b1;
        k = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // HOLD: J=0, K=0
        j = 1'b0;
        k = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // RESET: J=0, K=1
        j = 1'b0;
        k = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // SET again
        j = 1'b1;
        k = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // TOGGLE: J=1, K=1
        j = 1'b1;
        k = 1'b1;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // TOGGLE again
        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        // HOLD
        j = 1'b0;
        k = 1'b0;

        @(posedge clk);
        #1;

        $display(
            "%0t\t%b %b\t%b %b",
            $time, j, k, q, q_bar
        );

        $display("------------------------------------------");
        $display("Simulation completed successfully.");
        $display("==========================================");

        $finish;

    end

endmodule