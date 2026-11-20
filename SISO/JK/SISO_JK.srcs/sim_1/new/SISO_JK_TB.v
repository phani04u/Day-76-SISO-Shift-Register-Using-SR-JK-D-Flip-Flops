`timescale 1ns / 1ps
module SISO_JK_TB;
reg  J;
    reg  CLK;
    wire Q;
    wire Q_BAR;
    SISO_JK  UUT (.J(J),.CLK(CLK),.Q(Q),.Q_BAR(Q_BAR));
    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end
    initial begin
        J = 1'b0;
        #10;
        J = 1'b0; #10;
        J = 1'b1; #10;
        J = 1'b1; #10;
        J = 1'b1; #10;
        J = 1'b0; #40;
        $finish;
    end
    initial begin
        $monitor("Time = %0t ns | CLK = %b | J = %b | Q = %b | Q_BAR = %b",
                 $time, CLK, J, Q, Q_BAR);
    end
endmodule