module Complete_MIPS(CLK, RST, sw2, sw1, sw0, btnl, btnr, an, ca);
  // Will need to be modified to add functionality
  input CLK;
  input RST;
  input sw2, sw1, sw0, btnl, btnr;
  wire [31:0] D_Out;
  wire [6:0] A_Out;
  output [3:0] an;
  output [7:0] ca;  // Will need to be modified to add functionality

  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;
  wire sevenSegClk,slowClk;
  
  wire Switch[2:0];
  wire BTN[1:0];
  assign A_Out = ADDR;
  assign D_Out = Mem_Bus;
  
  assign SW = {sw2, sw1, sw0};

  MIPS CPU(slowClk, RST, CS, WE, ADDR, Mem_Bus, sevenSegClk, btnr, SW, an, ca);
  Memory MEM(CS, WE, slowClk, ADDR, Mem_Bus);
  clockdiv C1(28'd2500000, CLK, slowClk);
  clockdiv C2(28'd250000, CLK, sevenSegClk);

endmodule