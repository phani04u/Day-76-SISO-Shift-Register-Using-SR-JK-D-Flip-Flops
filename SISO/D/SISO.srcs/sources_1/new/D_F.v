`timescale 1ns / 1ps
module D_F(
input D,CLK,RST,
output reg Q
);
always @(posedge CLK) begin 
if (RST) 
   Q <= 1'b0;
else 
   Q <= D;
   
end
endmodule

