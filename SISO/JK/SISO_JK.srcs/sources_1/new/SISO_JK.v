`timescale 1ns / 1ps
module SISO_JK(
input  wire J,
    input  wire CLK,
    output wire Q,
    output wire Q_BAR
);
    wire K;
    wire Q1, Q2, Q3;
    wire Q_BAR1, Q_BAR2, Q_BAR3;
    assign K = ~J;
    JK_F FF0 (.J(J),  .K(K),      .CLK(CLK), .Q(Q1), .Q_BAR(Q_BAR1));
    JK_F FF1 (.J(Q1), .K(Q_BAR1), .CLK(CLK), .Q(Q2), .Q_BAR(Q_BAR2));
    JK_F FF2 (.J(Q2), .K(Q_BAR2), .CLK(CLK), .Q(Q3), .Q_BAR(Q_BAR3));
    JK_F FF3 (.J(Q3), .K(Q_BAR3), .CLK(CLK), .Q(Q),  .Q_BAR(Q_BAR));
endmodule

  