`timescale 1ns / 1ps
module SIS0_TB;
reg D,CLK,RST;
wire Q;
SISO  UUT(
.D(D),
.CLK(CLK),
.RST(RST),
.Q(Q)
);
always #5 CLK = ~CLK;
initial begin 
   CLK = 1'b0;
    RST = 1'b1; // Assert reset to clear x states
    D   = 1'b0; // Known starting input
    #10;
    RST = 1'b0;
    #2;  /// reset to the Q 
   D = 1'b1; #10; // first cycle
   D = 1'b1; #10; // second cycle 
   D = 1'b0; #10; // third cycle
   D = 1'b1; #10; // fourth cycle 
   D = 1'b0; #40; // extra 4 cycles so remaining bits exit Q
  $finish ;
end
initial begin 
     $monitor("Time = %0t ns | CLK = %b | D = %b | RST = %b| Q = %b ", $time, CLK, D,RST, Q);
end
endmodule 

