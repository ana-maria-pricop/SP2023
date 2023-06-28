// Code your testbench here
// or browse Examples

module SIPO_tb;
  
  //inputs
  reg clk,si;
  //outputs
  wire [3:0]q;
  
  SIPO dut(.clk(clk),.si(si),.q(q));
  
  initial
    begin
      clk = 0;
      si = 1;
      #10
      si = 0;
      #10
      si = 0;
      #10
      si = 1;
    end
  
  always #5 clk =~ clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #300
      $finish(1);
    end
endmodule