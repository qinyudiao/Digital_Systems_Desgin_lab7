module mips_testbench ();
    reg CLK;
    reg RST;
    wire CS, CS_Mux;
    wire WE, WE_Mux;
    wire [31:0] Mem_Bus;
    wire [6:0] Address, Address_Mux, AddressTB;

    parameter N = 10;
    reg [31:0] expected [N:1];
    reg init, WE_TB, CS_TB;
    
    integer i;
    
    initial begin
        expected[1] = 32'h00000006; //$1 content=6 decimal
        expected[2] = 32'h00000012; //$2 content=18 decimal
        expected[3] = 32'h00000018; //$3 content=24 decimal
        expected[4] = 32'h0000000C; //$4 content=12 decimal
        expected[5] = 32'h00000002; //$5 content=2
        expected[6] = 32'h00000016; //$6 content=22 decimal
        expected[7] = 32'h00000001; //$7 content=1
        expected[8] = 32'h00000120; //$8 content=288 decimal
        expected[9] = 32'h00000003; //$9 content=3
        expected[10] = 32'h00412022; //$10 content=5th instr
        CLK = 0;
    end
    
    MIPS CPU(CLK, RST, CS, WE, Address, Mem_Bus);
    Memory MEM(CS_Mux, WE_Mux, CLK, Address_Mux, Mem_Bus);
    
    assign Address_Mux = (init)? AddressTB : Address;
    assign WE_Mux = (init)? WE_TB : WE;
    assign CS_Mux = (init)? CS_TB : CS;
    
    always
        begin
        #10 CLK = ~CLK;
        end
    
    always begin
        RST <= 1'b1; //reset the processor
        //Notice that the memory is initialize in the in the memory module not here
        @(posedge CLK); //wait until posedge CLK
        //initialize the instructions from the testbench
        init <= 1; CS_TB <= 1; WE_TB <= 1;
        @(posedge CLK);
        init <= 0; CS_TB <= 0; WE_TB <= 0;
        // driving reset low here puts processor in normal operating mode
        @(posedge CLK);
            RST = 1'b0;
            for(i = 1; i <= N; i = i+1)begin
                @(posedge WE); //when a store word is executed
                @(negedge CLK);
                if(Mem_Bus != expected [i])
                    $display("Output mismatch: got %d, expected %d", Mem_Bus, expected [i]);
            end
        
        /* add your testing code here */
        // you can add in a 'Halt' signal here as well to test Halt operation
        // you will be verifying your program operation using the
        // waveform viewer and/or self-checking operations
        
            $display("TEST COMPLETE");
            $stop;
        end
endmodule