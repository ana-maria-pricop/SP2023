`ifndef DATA_MEMORY
`define DATA_MEMORY

module Data_Memory(
  input             clk,
  input             MemWrite, //activ pe 1, permite scrierea in memorie
  input      [31:0] Address,
  input      [31:0] WriteData,
  output reg [31:0] ReadData
);
  
  reg [31:0] RAM [63:0];
  reg [31:0] word2;

  integer i;
  
  
  initial 
    begin
      for (i = 0; i < 64; i = i + 1)
        RAM[i] = 0; 
    end
  
  
  always @(posedge clk)
    begin
      if (MemWrite == 1) 
        RAM[Address[31:2]] <= WriteData; //word-aligned write (for sw)
    end
  
  assign ReadData = RAM[Address[31:2]]; //word-aligned read (for lw)
  
  
  always @(*)
    begin
      word2 = RAM[2];
    end
  
  endmodule

  `endif