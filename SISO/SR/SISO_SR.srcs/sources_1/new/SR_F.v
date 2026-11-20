`timescale 1ns / 1ps
module SR_F (
    input  wire S,
    input  wire R,
    input  wire CLK,
    output reg  Q,
    output wire Q_BAR
);
    assign Q_BAR = ~Q;
    always @(negedge CLK) begin
        if (S == 1'b0 && R == 1'b0) begin
            Q <= Q;        // Hold previous state
        end
        else if (S == 1'b0 && R == 1'b1) begin
            Q <= 1'b0;     // Reset
        end
        else if (S == 1'b1 && R == 1'b0) begin
            Q <= 1'b1;     // Set
        end
        else begin
            Q <= 1'bx;     // Invalid condition (S=1, R=1)
        end
    end
endmodule

