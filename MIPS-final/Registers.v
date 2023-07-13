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
  
  reg [31:0] Registr [31:0]; //32 registrii de cate 32 biti
  integer i;
  
  reg [31:0] t0, t1, t2, t3, t5;
  
  /*reg [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg12, reg14, reg15, reg16;
  reg [31:0] reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27;
  reg [31:0] reg28, reg29, reg30, reg31;*/
  
   initial
     begin
       for(i = 0; i < 32; i = i + 1)
         Registr[i] = 0;
     end
  
  always @(posedge clk)
    if(RegWrite)
      Registr[WriteRegister] <= WriteData;
  
  assign ReadData1 = Registr[ReadRegister1];
  assign ReadData2 = Registr[ReadRegister2];
  
  always @(*)
    begin
      t0 = Registr[8];
      t1 = Registr[9];
      t2 = Registr[10];
      t3 = Registr[11];
      t5 = Registr[13];
      
      /*
      reg0  = Registr[0];
      reg1  = Registr[1];
      reg2  = Registr[2];
      reg3  = Registr[3];
      reg4  = Registr[4];
      reg5  = Registr[5];
      reg6  = Registr[6];
      reg7  = Registr[7];
      reg12 = Registr[12];
      reg14 = Registr[14];
      reg15 = Registr[15];
      reg16 = Registr[16];
      reg17 = Registr[17];
      reg18 = Registr[18];
      reg19 = Registr[19];
      reg20 = Registr[20];
      reg21 = Registr[21];
      reg22 = Registr[22];
      reg23 = Registr[23];
      reg24 = Registr[24];
      reg25 = Registr[25];
      reg26 = Registr[26];
      reg27 = Registr[27];
      reg28 = Registr[28];
      reg29 = Registr[29];
      reg30 = Registr[30];
      reg31 = Registr[31]; */
      end
  endmodule

  `endif

