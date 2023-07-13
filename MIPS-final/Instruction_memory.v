`ifndef INSTRUCTION_MEMORY
`define INSTRUCTION_MEMORY

module Instruction_Memory(
  input  [5:0] address,  //the address of the instruction to be fetched from memory
  output [31:0] instr    //the fetched instruction
);
  reg [31:0] mem [63:0];
  initial
    begin
      $readmemh("data.txt", mem);  //64 de instr de 32b
    end
  assign instr = mem[address]; 
  
endmodule
  `endif