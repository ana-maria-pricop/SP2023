// Code your testbench here
// or browse Examples

module PIPO_tb;
  
  reg clk;
  reg [3:0]d;
  wire [3:0]q;
  
  PIPO dut(.clk(clk),.d(d),.q(q));
  
  initial
    begin
      clk = 0;
      d = 0;
      #100
      d = 4'b 1001;
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