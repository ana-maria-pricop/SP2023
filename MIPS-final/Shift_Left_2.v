`ifndef SHIFT_LEFT_2
`define SHIFT_LEFT_2

//The left shift by 2 places means multiplication by 4

module Shift_Left_2(
  input  [31:0] a,
  output [31:0] y
);
  //assign y = {a[29:01], 2'b00};
  assign y = a << 2;
endmodule

  `endif