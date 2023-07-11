// Code your testbench here
// or browse Examples

module top_tb;

  reg clk;
  reg reset;
  reg [31:0] writedata;
  wire [31:0] ALUout;
  wire MemWrite;

  top dut (
    .clk(clk),
    .reset(reset),
    .writedata(writedata),
    .ALUout(ALUout),
    .MemWrite(MemWrite)
  );
  
   initial 
     begin
       $dumpfile("dump.vcd");
       $dumpvars;
     end

  always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    
    #10 reset = 0; 
    #100 $finish; 
  end

endmodule

/*module top_tb;

  reg clk;
  reg reset;
  
  wire [31:0] writedata;
  wire [31:0] ALUout;
  wire        MemWrite;

  top dut (
    .clk(clk),
    .reset(reset),
    .writedata(writedata),
    .ALUout(ALUout),
    .MemWrite(MemWrite)
  );
  
 initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

	

  always #1 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;  */







