module Complete_MIPS(CLK, RST, A_Out, D_Out);
  // Will need to be modified to add functionality
  input CLK;
  input RST;
  output A_Out;
  output D_Out;

  wire CS, WE;
  wire [6:0] ADDR;
  wire [31:0] Mem_Bus;

  MIPS CPU(CLK, RST, CS, WE, ADDR, Mem_Bus);
  Memory MEM(CS, WE, CLK, ADDR, Mem_Bus);

endmodule