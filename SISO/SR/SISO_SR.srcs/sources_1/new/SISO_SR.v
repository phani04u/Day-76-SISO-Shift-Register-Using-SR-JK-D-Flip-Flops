`timescale 1ns / 1ps
module SISO_SR (
    input  wire S,
    input  wire CLK,
    output wire Q,
    output wire Q_BAR
);
    wire R;
    wire Q1, Q2, Q3;
    wire Q_BAR1, Q_BAR2, Q_BAR3;
    assign R = ~S;
    SR_F FF0 (.S(S),  .R(R),      .CLK(CLK), .Q(Q1), .Q_BAR(Q_BAR1));
    SR_F FF1 (.S(Q1), .R(Q_BAR1), .CLK(CLK), .Q(Q2), .Q_BAR(Q_BAR2));
    SR_F FF2 (.S(Q2), .R(Q_BAR2), .CLK(CLK), .Q(Q3), .Q_BAR(Q_BAR3));
    SR_F FF3 (.S(Q3), .R(Q_BAR3), .CLK(CLK), .Q(Q),  .Q_BAR(Q_BAR));
endmodule