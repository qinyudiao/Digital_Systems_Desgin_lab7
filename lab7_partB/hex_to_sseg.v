module hex_to_sseg(binary, seven);
    input [3:0] binary;
    output[7:1] seven;
    reg [7:1] seven;
    always @(binary)
    begin
        case (binary)
            4'b0000 : seven = 7'b0000001 ;
            4'b0001 : seven = 7'b1001111 ;
            4'b0010 : seven = 7'b0010010 ;
            4'b0011 : seven = 7'b0000110 ;
            4'b0100 : seven = 7'b1001100 ;
            4'b0101 : seven = 7'b0100100 ;
            4'b0110 : seven = 7'b0100000 ;
            4'b0111 : seven = 7'b0001111 ;
            4'b1000 : seven = 7'b0000000 ;
            4'b1001 : seven = 7'b0001100 ;
            4'b1010 : seven = 7'b0001000 ;
            4'b1011 : seven = 7'b1100000 ;
            4'b1100 : seven = 7'b0110001 ;
            4'b1101 : seven = 7'b1000010 ;
            4'b1110 : seven = 7'b0110000 ;
            4'b1111 : seven = 7'b0111000 ;
            default : seven = 7'b0000001 ;
        endcase
    end
endmodule
