// Code your testbench here
// or browse Examples

`timescale 1ns/1ps

module SISO_tb;
  
  //inputs
  reg clk,si;
  //outputs
  wire so;
  
  SISO dut(.clk(clk),.si(si),.so(so));
  
  initial
    begin
      clk = 0;
      si = 1;
      #10
      si = 1;
      #10
      si = 1;
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
