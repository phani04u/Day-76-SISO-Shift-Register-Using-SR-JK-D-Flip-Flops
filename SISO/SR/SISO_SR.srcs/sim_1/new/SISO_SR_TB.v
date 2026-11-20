`timescale 1ns / 1ps
module SISO_SR_TB;
    reg  S;
    reg  CLK;
    wire Q;
    wire Q_BAR;
    SISO_SR UUT (.S(S),.CLK(CLK),.Q(Q),.Q_BAR(Q_BAR));
    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end
    initial begin
        S = 1'b0;
        #10;
        S = 1'b0; #10;
        S = 1'b1; #10;
        S = 1'b1; #10; 
        S = 1'b1; #10;
        S = 1'b0; #40;
        $finish;
    end
    initial begin
        $monitor("Time = %0t ns | CLK = %b | S = %b | Q = %b | Q_BAR = %b",
                 $time, CLK, S, Q, Q_BAR);
    end
endmodule