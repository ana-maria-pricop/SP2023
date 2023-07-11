`ifndef DATA_MEMORY
`define DATA_MEMORY

module Data_Memory(
  input             clk,
  input             MemWrite, // activa pe 1 , permite scriere in memorie
  input      [31:0] Address,
  input      [31:0] WriteData,
  output reg [31:0] ReadData
);
  
  reg [31:0] RAM [63:0];
  integer i;
  
  reg [31:0] rd0,rd1,rd2,rd3,rd4,rd5,rd6,rd7,rd8,rd9,rd10,rd11,rd12,rd13,rd14,rd15,rd16;
  reg [31:0] rd17,rd18,rd19,rd20,rd21,rd22,rd23,rd24;
  reg [31:0] rd25,rd26,rd27,rd28,rd29,rd30,rd31;
  
 
  
 /* initial begin
  ReadData <= 0;
    for (i = 0; i < 64; i = i + 1) begin
      RAM[i] = i;
  end
end*/
  
  initial begin
    for (i = 0; i < 64; i = i + 1)
      RAM[i] = 0; end
    

  always @(posedge clk)
  begin
    if (MemWrite == 1) 
      RAM[Address[31:2]] <= WriteData; //// word-aligned write (for sw)
  end
  
   assign ReadData = RAM[Address[31:2]]; //// word-aligned read (for lw)
 // assign ReadData = RAM[Address];
  
    /*if (MemRead == 1'b1)
      begin
        ReadData <= RAM[Address];
      end*/
  
  always @(*)
    begin
      rd0 = RAM[0];
      rd1 = RAM[1];
      rd2 = RAM[2];
      rd3 = RAM[3];
      rd4 = RAM[4];
      rd5 = RAM[5];
      rd6 = RAM[6];
      rd7 = RAM[7];
      rd8 = RAM[8];
      rd9 = RAM[9];
      rd10 = RAM[10];
      rd11 = RAM[11];
      rd12 = RAM[12];
      rd13 = RAM[13];
      rd14 = RAM[14];
      rd15 = RAM[15];
      rd16 = RAM[16];
      rd17 = RAM[17];
      rd18 = RAM[18];
      rd19 = RAM[19];
      rd20 = RAM[20];
      rd21 = RAM[21];
      rd22 = RAM[22];
      rd23 = RAM[23];
      rd24 = RAM[24];
      rd25 = RAM[25];
      rd26 = RAM[26];
      rd27 = RAM[27];
      rd28 = RAM[28];
      rd29 = RAM[29];
      rd30 = RAM[30];
      rd31 = RAM[31]; 
      
    end
  
endmodule
  `endif