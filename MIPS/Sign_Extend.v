`ifndef SIGN_EXTEND
`define SIGN_EXTEND

module Sign_Extend(
  input  [15:0] a,
  output [31:0] y
);
  assign y = {{16{a[15]}},a};
  
endmodule
  `endif

/*The expression 16{a[15]} creates a temporary vector of 16 bits, where all the bits are set to the value of a[15]. For example, if a[15] is 1, then 16{a[15]} would be a 16-bit vector of all ones (16'b1111_1111_1111_1111).

The concatenation operator {} is used to concatenate two vectors. In this case, we concatenate 16{a[15]} with a. The resulting vector is 32 bits long, where the MSB contains the sign bit (the most significant bit of a[15]), and the remaining bits contain the original 16-bit input a. This operation effectively extends the sign of the input a to fill the additional 16 bits.*/