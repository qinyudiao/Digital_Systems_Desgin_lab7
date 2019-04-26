module mips_testbench ();
  reg CLK;
  reg RST;
  wire CS;
  wire WE;
  wire [31:0] Mem_Bus;
  wire [6:0] Address;

  initial
  begin
    CLK = 0;
  end

  MIPS CPU(CLK, RST, CS, WE, Address, Mem_Bus);
  Memory MEM(CS, WE, CLK, Address, Mem_Bus);

  always
  begin
    #5 CLK = !CLK;
  end

  always
  begin
    RST <= 1'b1; //reset the processor

    //Notice that the memory is initialize in the in the memory module not here

    @(posedge CLK);
    // driving reset low here puts processor in normal operating mode
    RST = 1'b0;

    /* add your testing code here */
    // you can add in a 'Halt' signal here as well to test Halt operation
    // you will be verifying your program operation using the
    // waveform viewer and/or self-checking operations
    
//    start:
//        addi $6, $1, 0
//        andi $8, $8, 0
//        lui $4, 28672
//        lui $5, 32767
//        ori $8, $8, 11
        
//    loop:
//        beq $6, $1, loop
//        addi $6, $1, 0
//        sll $7, $8, $7
//        jr $7
//        j loop
        
//    call_table:
//        jal operation0
//        j loop
//        jal operation1
//        j loop
//        jal operation2
//        j loop
//        jal operation3
//        j loop
//        jal operation4
//        j loop
//        jal operation5
//        j loop
        
//    operation0:
//        add8 $2, $4, $5

    $display("TEST COMPLETE");
    $stop;
  end

endmodule