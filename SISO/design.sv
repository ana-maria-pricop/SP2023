// Code your design here
`timescale 1ns/1ps

module SISO(si,so,clk);
  
  input si,clk;
  output so;
  
  reg [3:0]q = 0; //initial q[3] q[2] q[1] q[0]=0 0 0 0
  
  always @(posedge clk)
    begin
      q[3] <= si;
      q[2] <= q[3];
      q[1] <= q[2];
      q[0] <= q[1];
    end
  
  assign so = q[0];
  
endmodule

