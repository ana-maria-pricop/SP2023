`ifndef ALU_CONTROL
`define ALU_CONTROL

//permite selectarea operatiei care va fi executata de catre ALU

module ALU_control(
  input      [5:0] funct, 
  input      [1:0] ALUOp, 
  output reg [2:0] AluControl  
);
  
  always @(*)
    begin
      casex( {ALUOp, funct} )
        
       //add
      {2'b00, 6'bxxxxxx}: 
        AluControl <= 3'b010; 
      
      //subtract
      {2'bx1, 6'bxxxxxx}: 
        AluControl <= 3'b110; 
      
      //add
      {2'b1x, 6'b100000}: 
        AluControl <= 3'b010; 
      
      //subtract
      {2'b1x, 6'b100010}: 
        AluControl <= 3'b110; 
      
      //and
      {2'b1x, 6'b100100}: 
        AluControl <= 3'b000; 
      
      //or
      {2'b1x, 6'b100101}: 
        AluControl <= 3'b001; 
      
      //slt set less than
        {2'b1x, 6'b101010}: 
        AluControl <= 3'b111; 
        
      //xor
        {2'b1x, 6'b100110}: 
        AluControl <= 3'b011; 
      
        default: AluControl <= 3'bxxx;
      endcase
    end
endmodule
      

`endif

  