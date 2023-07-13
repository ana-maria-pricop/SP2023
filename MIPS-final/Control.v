`ifndef CONTROL
`define CONTROL

//activeaza si dezactiveaza functionalitatile blocurilor din arhitectura in functie de opcode


module Control(
  input      [5:0] opcode,
  output reg       RegDst,
  output reg       Jump,
  output reg       Branch,
  //output reg       MemRead,
  output reg       MemToReg,
  output reg [1:0] ALUOp,
  output reg       MemWrite,
  output reg       ALUSrc,
  output reg       RegWrite
);


  always @(opcode)
    begin
    
    casex(opcode)
      6'b000000:     //toate instr R-type au opcode-ul 0, sunt diferentiate prin func
        begin
        RegDst = 1;
        Jump = 0;
        Branch = 0;
       // MemRead = 0;
        MemToReg = 0;
        ALUOp = 2'b10;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 1;
        end
      
      6'b100011:  //lw
        begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        //MemRead = 1;
        MemToReg = 1;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
        end
      
      6'b101011:  //sw
        begin
        //RegDst = 1'bx;
        RegDst = 1'b0;
        Jump = 0;
        Branch = 0;
        //MemRead = 0;
        //MemToReg = 1'bx;
        MemToReg = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 1;
        ALUSrc = 1;
        RegWrite = 0;
        end
      
      6'b000100:  //beq
        begin
        //RegDst = 1'bx;
        RegDst = 1'b0;
        Jump = 0;
        Branch = 1;
        //MemRead = 0;
        //MemToReg = 1'bx;
        MemToReg = 1'b0;
        ALUOp = 2'b01;
        MemWrite = 0;
        ALUSrc = 0;
        RegWrite = 0;
        end
        
      6'b001000:  //addi
        begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        //MemRead = 0;
        MemToReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1;
        RegWrite = 1;
        end
      
      6'b000010:  //j
        begin
        RegDst = 1'b0;
        Jump = 1'b1;
        Branch = 1'b0;
        //MemRead = 0;
        MemToReg = 1'b0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 1'b0; 
        RegWrite = 0;
        end
      
      default:  //opcode necunoscut
        begin
        RegDst = 0;
        Jump = 0;
        Branch = 0;
        //MemRead = 0;
        MemToReg = 0;
        ALUOp = 2'b00;
        MemWrite = 0;
        ALUSrc = 0; 
        RegWrite = 0;
        end
      endcase
    end
endmodule
   
`endif