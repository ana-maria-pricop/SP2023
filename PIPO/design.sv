// Code your design here

module PIPO(clk,d,q);
  
  input clk;
  input [3:0]d;
  output reg [3:0]q;
  
  always @(posedge clk)
    begin
      q[3] <= d[3];
      q[2] <= d[2];
      q[1] <= d[1];
      q[0] <= d[0];
      //sau q <= d;
    end
  
endmodule