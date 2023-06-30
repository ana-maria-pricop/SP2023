// Code your testbench here
// or browse Examples

module readfile_tb;
  
  reg [31:0]in;
  reg clk;
  wire[31:0]out;
  
  readfile dut(.clk(clk),.in(in),.out(out));
  
  initial clk = 1'b0;
  always #10 clk = ~clk;
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
  initial 
    begin
      #200 $finish;  
    end
endmodule
