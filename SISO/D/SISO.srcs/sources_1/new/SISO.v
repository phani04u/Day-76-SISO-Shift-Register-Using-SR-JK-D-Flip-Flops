`timescale 1ns / 1ps
module SISO(
input D,
input  CLK,RST,
output  wire Q
);
wire Q1,Q2,Q3;

D_F  FF1(.D(D),.CLK(CLK),.RST(RST),.Q(Q1)); /// first block

D_F  FF2(.D(Q1),.CLK(CLK),.RST(RST),.Q(Q2)); /// second block

D_F  FF3(.D(Q2),.CLK(CLK),.RST(RST),.Q(Q3)); /// third block

D_F  FF4(.D(Q3),.CLK(CLK),.RST(RST),.Q(Q)); /// fourth block
endmodule 


 