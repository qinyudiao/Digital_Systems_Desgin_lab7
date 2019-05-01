module SevenSeg_Display(CLK, num, AN, seven);

input [15:0] num;
input CLK;
output [3:0] AN;
output [7:1] seven;

reg [1:0] sevenSeg_state, sevenSeg_nextState;
reg [3:0] binary;
reg [3:0] AN;

always @(sevenSeg_state or num) begin
    AN = 4'b1111;
	sevenSeg_nextState = 0;
	case(sevenSeg_state)
		0 : begin
			AN[0] = 0;
			sevenSeg_nextState = 1;
			binary = num[3:0];
		end
		1 : begin
		    AN[1] = 0;
			sevenSeg_nextState = 2;
			binary = num[7:4];
		end
		2 : begin
		    AN[2] = 0;
            sevenSeg_nextState = 3;
            binary = num[11:8];
		end
		3 : begin
		    AN[3] = 0;
            sevenSeg_nextState = 0;
            binary = num[15:12];
		end
		default : begin
		    sevenSeg_nextState = 0;
		    binary = num[3:0];
		end
	endcase
end

always @(posedge CLK) begin
	sevenSeg_state <= sevenSeg_nextState;
end

hex_to_sseg S(binary, seven);

endmodule