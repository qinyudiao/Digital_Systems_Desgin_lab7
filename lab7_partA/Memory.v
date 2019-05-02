module Memory(CS, WE, CLK, ADDR, Mem_Bus);
  input CS;
  input WE;
  input CLK;
  input [6:0] ADDR;
  inout [31:0] Mem_Bus;

  reg [31:0] data_out;
  reg [31:0] RAM [0:127];

  integer i;

  initial
  begin
    /* Write your Verilog-Text IO code here */
	for (i=0; i<128; i= i+1) begin
		RAM[i] = 0;
	end
	#10
	$readmemh("MIPS_Instructions.txt", RAM);
	#10
	for (i=0; i<128; i = i+1) begin
		$display("RAM[%i]%b", i, RAM[i]);
	end
	#10
	$finish;
  end

  assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;

  always @(negedge CLK)
  begin

    if((CS == 1'b1) && (WE == 1'b1))
      RAM[ADDR] <= Mem_Bus[31:0];

    data_out <= RAM[ADDR];
  end
endmodule