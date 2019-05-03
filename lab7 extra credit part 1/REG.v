module REG(CLK, RegW, DR, SR1, SR2, Reg_In, btnr, SW, AN, seven, ReadReg1, ReadReg2);
  input CLK;
  input RegW;
  input [4:0] DR;
  input [4:0] SR1;
  input [4:0] SR2;
  input [31:0] Reg_In;
  input btnr;
  input [2:0] SW;
  output [3:0] AN;
  output [7:1] seven;
  output reg [31:0] ReadReg1;
  output reg [31:0] ReadReg2;
  reg [15:0] value;
  wire sevenSegCLK;

  reg [31:0] REG [0:31];
  integer i;

  SevenSeg_Display S(sevenSegCLK, value, AN, seven);
  
initial begin
    ReadReg1 = 0;
    ReadReg2 = 0;
    for(i = 0; i < 34; i = i+1) REG[i] = 0;
end

always @(btnr or SW or REG[2] or REG[3])
  begin
    value = 0;
    case(btnr)
        1'b0: begin
            value = REG[2][15:0]; //show the lower 16 bits of $2
        end
        1'b1: begin
            value = REG[2][31:16]; // show the upper 16 bits of $2
        end
        default : value = 0;
    endcase      
  end

  always @(posedge CLK)
  begin
    REG[1][2:0] <= SW;
    if(RegW == 1'b1)
      REG[DR] <= Reg_In[31:0];

    ReadReg1 <= REG[SR1];
    ReadReg2 <= REG[SR2];
  end
endmodule