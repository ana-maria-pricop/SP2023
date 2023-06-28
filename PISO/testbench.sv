// Code your testbench here
// or browse Examples

module PISO_tb();
  
  reg clk;
  reg mode;
  reg [3:0]d;
  wire so;
  
  PISO dut(.clk(clk),.d(d),.mode(mode),.so(so));
  
  initial
    begin
    clk = 0;
    d = 4'b 1001;
    mode = 1;
    #10
    mode = 0;
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