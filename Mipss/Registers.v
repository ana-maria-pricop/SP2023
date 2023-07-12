`ifndef REGISTERS
`define REGISTERS

module Registers(
  input clk,
  input RegWrite,
  input  [4:0]  ReadRegister1,
  input  [4:0]  ReadRegister2,
  input  [4:0]  WriteRegister,
  input  [31:0] WriteData,
  output [31:0] ReadData1,
  output [31:0] ReadData2
);
  reg [31:0] Registr [31:0];
  integer i;
  
   reg [31:0] rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7,rd8,rd9,rd10,rd11,rd12,rd13,rd14,rd15,rd16;
  reg [31:0] rd17,rd18,rd19,rd20,rd21,rd22,rd23,rd24;
  reg [31:0] rd25,rd26,rd27,rd28,rd29,rd30,rd31;
  
   initial
    begin
    for(i = 0; i < 32;i = i + 1)
      Registr[i] = 0;
      
    end
  
  
  
  always @(posedge clk)
    if(RegWrite)
      Registr[WriteRegister] <= WriteData;
  
  assign ReadData1 = (ReadRegister1 != 0) ? Registr[ReadRegister1] : 0;
  assign ReadData2 = (ReadRegister2 != 0) ? Registr[ReadRegister2] : 0;
  
  always @(*)
    begin
      rd0 = Registr[0];
      rd1 = Registr[1];
      rd2 = Registr[2];
      rd3 = Registr[3];
      rd4 = Registr[4];
      rd5 = Registr[5];
      rd6 = Registr[6];
      rd7 = Registr[7];
      rd8 = Registr[8];
      rd9 = Registr[9];
      rd10 = Registr[10];
      rd11 = Registr[11];
      rd12 = Registr[12];
      rd13 = Registr[13];
      rd14 = Registr[14];
      rd15 = Registr[15];
      rd16 = Registr[16];
      rd17 = Registr[17];
      rd18 = Registr[18];
      rd19 = Registr[19];
      rd20 = Registr[20];
      rd21 = Registr[21];
      rd22 = Registr[22];
      rd23 = Registr[23];
      rd24 = Registr[24];
      rd25 = Registr[25];
      rd26 = Registr[26];
      rd27 = Registr[27];
      rd28 = Registr[28];
      rd29 = Registr[29];
      rd30 = Registr[30];
      rd31 = Registr[31]; 
      
    end
  
  
endmodule
  `endif

