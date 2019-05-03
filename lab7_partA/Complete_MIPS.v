module Complete_MIPS(CLK, RST, HALT, led);
  // Will need to be modified to add functionality
  input CLK;
  input RST;
  input HALT;
  wire [6:0] A_Out;
  wire [31:0] D_Out;
  output[7:0] led;

  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;
  assign A_Out = ADDR;
  assign D_Out = Mem_Bus;
  
  wire slowClk;

  clockdiv slow_clk(2500000, CLK, slowClk);
  
  MIPS CPU(slowClk, RST, CS, WE, ADDR, Mem_Bus, led, HALT);
  Memory MEM(CS, WE, slowClk, ADDR, Mem_Bus);

endmodule