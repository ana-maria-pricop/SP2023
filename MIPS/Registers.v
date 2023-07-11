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
  
  initial begin
		Registr[0] <= 32'h00000000;
		Registr[8] <= 32'h00000000;
		Registr[9] <= 32'h00000000;
		Registr[10] <= 32'h00000000;
		Registr[11] <= 32'h00000000;
		Registr[12] <= 32'h00000000;
		Registr[13] <= 32'h00000000;
		Registr[14] <= 32'h00000000;
		Registr[15] <= 32'h00000000;
		Registr[16] <= 32'h00000000;
		Registr[17] <= 32'h00000000;
		Registr[18] <= 32'h00000000;
		Registr[19] <= 32'h00000000;
		Registr[20] <= 32'h00000000;
		Registr[21] <= 32'h00000000;
		Registr[22] <= 32'h00000000;
		Registr[23] <= 32'h00000000;
		Registr[24] <= 32'h00000000;
		Registr[25] <= 32'h00000000;
		Registr[29] <= 32'd252; // this value should point to the top of data memory, dont forget byte addressing
		Registr[31] <= 32'b0;
	end
  
  
  always @(posedge clk)
    if(RegWrite)
      Registr[WriteRegister] <= WriteData;
  
  assign ReadData1 = (ReadRegister1 != 0) ? Registr[ReadRegister1] : 0;
  assign ReadData2 = (ReadRegister2 != 0) ? Registr[ReadRegister2] : 0;
  
  
endmodule
  `endif

