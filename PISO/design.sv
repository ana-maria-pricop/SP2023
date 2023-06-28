// Code your design here

module PISO(clk,d,mode,so);
  
  input clk;
  input mode;
  input [3:0]d;
  output so;
  reg [3:0]q = 0 ;
  
  always @(posedge clk)
    begin
      if(mode == 1)
        q <= d;
      else
        begin
          q[3] <= 1'bx;
          q[2] <= q[3];
          q[1] <= q[2];
          q[0] <= q[1];
        end
    end
  assign so = q[0]; 
endmodule