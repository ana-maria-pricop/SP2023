`ifndef ADDER
`define ADDER

module Adder (
  input  [31:0] a,
  input  [31:0] b,
  output [31:0] y
);
  assign y = a + b;
  
endmodule

 `endif