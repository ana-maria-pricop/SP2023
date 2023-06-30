// Code your design here
//reads data from a file ("text.txt") and stores it in a memory array

module readfile(in,out,clk);
  
  input[31:0]in;
  output reg[31:0]out;
  input clk;
  integer i;
  
  reg [31:0] memory [0:9]; //A 10-element memory array, where each element is a 32-bit register
  
  initial $readmemh("data.txt", memory);  //reads data from the file "text.txt" and initialize the memory array with the contents of the file
  
  reg[4:0]index = 5'b0000; //A 5-bit register used as an index to access the memory array
  
  initial
    begin
      for(i=0; i<9; i = i+1)
        $display("%h",i, memory[i]); //?
    end
      
  always @(posedge clk)
    begin
      out = memory[index]; //the value of "out" is assigned to the memory element indexed by "index"
      index = index + 1; //"index" is then incremented by 1, ensuring that the next memory element will be accessed in the subsequent clock cycle
    end 
endmodule