// Code your design here

`include "Control.v"
`include "ALU_control.v"
`include "PC.v"
`include "ALU.v"
`include "Instruction_memory.v"
`include "Sign_Extend.v"
`include "Shift_Left_2.v"
`include "Data_Memory.v"
`include "Registers.v"
`include "Adder.v"
`include "MUX.v"

module Controller(        //Control + ALUcontrol + and
  
  input [5:0]  opcode,
  input [5:0]  funct,
  input        zero,
  
  output       MemToReg,
  output       MemWrite,
  output 	   PCSrc,
  output       ALUSrc,
  output       RegDst,
  output       RegWrite,
  output       Jump,
  output [2:0] AluControl
); 
  
  wire       Branch;
  wire [1:0] ALUOp;
  wire       zero;
  wire [5:0] opcode;
  wire 		 MemToReg;
  wire 		 MemWrite;
  wire 		 ALUSrc;
  wire 		 RegDst;
  wire 	 	 RegWrite;
  wire 		 Jump;
  wire [5:0] func;
  wire [2:0] AluControl;
  wire       PCSrc;
 
  
  Control     U1 ( opcode, RegDst, Jump, Branch, MemToReg, ALUOp, MemWrite, ALUSrc, RegWrite );
  ALU_control U2 ( funct, ALUOp, AluControl);
 
  assign PCSrc = Branch & zero; 
endmodule
  
  
  module Datapath(
    input         clk,
    input         reset,
    input         MemToReg,
    input         PCSrc,
    input         ALUSrc,
    input         RegDst,
    input         RegWrite,
    input         Jump,
    input  [2:0]  AluControl,
    output        zero,
    output [31:0] pc,
    input  [31:0] instr,
    output [31:0] ALUout,
    output [31:0] writedata,
    input  [31:0] ReadData
     );
    
    wire [4:0]  writereg; 
    wire [31:0] pcnext;
    wire [31:0] pcnextbr;
    wire [31:0] pcplus4;
    wire [31:0] pcbranch;
    wire [31:0] signimm;
    wire [31:0] signimmsh;
    wire [31:0] srca;
    wire [31:0] srcb;
    wire [31:0] result;
    wire [31:0] scra;
    wire [31:0] scrb;
    wire [31:0] pc;
    wire        RegWrite;
    wire [31:0] writedata;
    
    
  //next pc logic
    ProgramCounter #(32)  U3 ( clk, reset, pcnext, pc                                       );
    Adder                 U4 ( pc, 32'b100, pcplus4                                         );
    Shift_Left_2 #(32,32) U5 ( signimm, signimmsh                                           );
    Adder                 U6 ( pcplus4, signimmsh, pcbranch                                 );
    mux2_1         #(32)  U7 ( pcplus4, pcbranch, PCSrc, pcnextbr                           );
    mux2_1         #(32)  U8 ( pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, Jump, pcnext );
    
    //register file logic
    Registers             U9 ( clk, RegWrite, instr[25:21], instr[20:16], writereg, result, srca, writedata );
    mux2_1         #(5)   U10( instr[20:16], instr[15:11], RegDst, writereg                                 );
    mux2_1         #(32)  U11( ALUout, ReadData, MemToReg, result                                           );
    Sign_Extend           U12( instr[15:0], signimm                                                         );
    
    //ALU logic
    mux2_1         #(32)  U13( writedata, signimm, ALUSrc, srcb     );
    ALU                   U14( srca, srcb, AluControl, ALUout, zero );
  
endmodule


module mips (
  input         clk,
  input         reset,
  output [31:0] pc,
  input  [31:0] instr,
  output        MemWrite,
  output [31:0] ALUout,
  output [31:0] writedata,
  input  [31:0] ReadData
  );

  wire [2:0] AluControl;
  wire MemToReg;
  wire Branch;
  wire ALUSrc;
  wire RegDst;
  wire RegWrite;
  wire Jump;
  wire zero;
  wire PCSrc;
  
  Controller U15 ( instr[31:26], instr[5:0], zero, MemToReg, MemWrite, PCSrc, ALUSrc, RegDst, RegWrite, Jump, AluControl                 );
  Datapath   U16 ( clk, reset, MemToReg, PCSrc, ALUSrc, RegDst, RegWrite, Jump, AluControl, zero, pc, instr, ALUout, writedata, ReadData );
  
endmodule


module top (
  input clk,
  input reset,
  output [31:0] writedata,
  output [31:0] ALUout,
  output        MemWrite
);
  wire [31:0] pc;
  wire [31:0] instr;
  wire [31:0] ReadData;
  
  // instantiate processor and memories

  mips               U17 ( clk, reset, pc, instr, MemWrite, ALUout, writedata, ReadData );
  Instruction_Memory U18 ( pc[7:2], instr); 
  Data_Memory        U19 ( clk, MemWrite, ALUout, writedata, ReadData );
  
  endmodule
 
  
  //dataadr
  
