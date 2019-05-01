module Complete_MIPS(SW, BTN, CLK, RST, AN, seven);
  // Will need to be modified to add functionality
  input CLK;
  input RST;
  input [1:0] BTN;
  input [2:0] SW;
  output [3:0] AN;
  output [7:1] seven;

  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;
  wire sevenSegClk,slowClk;

  MIPS CPU(SW, BTN, slowClk, sevenSegClk, RST, CS, WE, ADDR, Mem_Bus, AN, seven);
  Memory MEM(CS, WE, slowClk, ADDR, Mem_Bus);
  clockdiv C1(28'd2500000, CLK, slowClk);
  clockdiv C2(28'd250000, CLK, sevenSegClk);

endmodule