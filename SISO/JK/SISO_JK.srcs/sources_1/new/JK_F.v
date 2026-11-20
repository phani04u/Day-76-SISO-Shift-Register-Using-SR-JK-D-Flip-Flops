`timescale 1ns / 1ps
module JK_F(
    input  wire J,
    input  wire K,
    input  wire CLK,
    output reg  Q,
    output wire Q_BAR
);
    assign Q_BAR = ~Q;

    always @(negedge CLK) begin
        if (J == 1'b0 && K == 1'b0)
            Q <= Q;        // Hold
        else if (J == 1'b0 && K == 1'b1)
            Q <= 1'b0;     // Reset
        else if (J == 1'b1 && K == 1'b0)
            Q <= 1'b1;     // Set
        else
            Q <= ~Q;       // Toggle (J=1, K=1)
    end
endmodule
