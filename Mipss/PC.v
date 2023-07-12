`ifndef PC
`define PC

module ProgramCounter # ( parameter WIDTH = 8 )
  ( input	 		 	   clk,
    input 			       reset,
    input	   [WIDTH-1:0] NextAddr, //pcnext
    output reg [WIDTH-1:0] Addr  //pc
  );
  
  always @(posedge clk, posedge reset)
    begin
      if(reset)
        Addr <= 0;
      else
        Addr <= NextAddr;
    end
endmodule

`endif

/*program counter register - holds the current address of the instruction memory.  
This module should be updated at the positive edge of the clock.*/