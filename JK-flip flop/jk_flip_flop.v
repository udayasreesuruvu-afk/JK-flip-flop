`timescale 1ns/1ps

module jk_flip_flop (
    input  wire clk,
    input  wire rst,
    input  wire j,
    input  wire k,
    output reg  q,
    output wire q_bar
);

    assign q_bar = ~q;

    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;       // Hold
                2'b01: q <= 1'b0;    // Reset
                2'b10: q <= 1'b1;    // Set
                2'b11: q <= ~q;      // Toggle
                default: q <= 1'bx;
            endcase
        end
    end

endmodule