`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 06:03:24 PM
// Design Name: 
// Module Name: Display7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Display7seg(
    input finalLife,
    input truth,
    input clk,
    input [3:0] digit1,
    input [3:0] digit2,
    input [3:0] digit3,
    input [3:0] digit4,
    output reg[6:0] seg, 
    output reg [3:0] an 
    );
    
    integer digit = 0;
    reg [13:0] timer;
    
    always @ (posedge clk) //select digit
            begin
            
            if(digit > 4) begin
                digit <=0;
                end
            
            if(timer == 10_000) begin
                timer  <= 0;
                digit <= digit + 1;
                end
            
            else
                timer <= timer+1;
            end
//        end
    
    always @ (digit)
        begin
            case (digit)
                0: an <= 4'b1110;
                1: an <= 4'b1101;
                2: an <= 4'b1011;
                3: an <= 4'b0111;
            endcase
        end
        
    always @ (*)
        begin
        case({finalLife, truth})
//        case(truth | final)
            2'b10: begin
            case(an)
                    4'b1110: begin
                        case(digit1)
                            4'b0000 : seg <= 7'b1000000; // 0
                            4'b0001 : seg <= 7'b1111001; // 1
                            4'b0010 : seg <= 7'b0100100; // 2
                            4'b0011 : seg <= 7'b0110000; // 3
                            4'b0100 : seg <= 7'b0011001; // 4
                            4'b0101 : seg <= 7'b0010010; // 5
                            4'b0110 : seg <= 7'b0000010; // 6
                            4'b0111 : seg <= 7'b1111000; // 7
                            4'b1000 : seg <= 7'b0000000; // 8
                            4'b1001 : seg <= 7'b0010000; // 9
                            4'b1010 : seg <= 7'b0001000; // A
                            4'b1011 : seg <= 7'b0000011; // b
                            4'b1100 : seg <= 7'b1000110; // C
                            4'b1101 : seg <= 7'b0100001; // d
                            4'b1110 : seg <= 7'b0000110; // E
                            4'b1111 : seg <= 7'b0001110; // F
                            default : seg <= 7'b0111111;
                        endcase
                    end
                    4'b1101: begin
                        case(digit2)
                            4'b0000 : seg <= 7'b1000000; // 0
                            4'b0001 : seg <= 7'b1111001; // 1
                            4'b0010 : seg <= 7'b0100100; // 2
                            4'b0011 : seg <= 7'b0110000; // 3
                            4'b0100 : seg <= 7'b0011001; // 4
                            4'b0101 : seg <= 7'b0010010; // 5
                            4'b0110 : seg <= 7'b0000010; // 6
                            4'b0111 : seg <= 7'b1111000; // 7
                            4'b1000 : seg <= 7'b0000000; // 8
                            4'b1001 : seg <= 7'b0010000; // 9
                            4'b1010 : seg <= 7'b0001000; // A
                            4'b1011 : seg <= 7'b0000011; // b
                            4'b1100 : seg <= 7'b1000110; // C
                            4'b1101 : seg <= 7'b0100001; // d
                            4'b1110 : seg <= 7'b0000110; // E
                            4'b1111 : seg <= 7'b0001110; // F
                            default : seg <= 7'b0111111;
                        endcase
                    end
                    4'b1011: begin
                        case (digit3)
                            4'b0000 : seg <= 7'b1000000; // 0
                            4'b0001 : seg <= 7'b1111001; // 1
                            4'b0010 : seg <= 7'b0100100; // 2
                            4'b0011 : seg <= 7'b0110000; // 3
                            4'b0100 : seg <= 7'b0011001; // 4
                            4'b0101 : seg <= 7'b0010010; // 5
                            4'b0110 : seg <= 7'b0000010; // 6
                            4'b0111 : seg <= 7'b1111000; // 7
                            4'b1000 : seg <= 7'b0000000; // 8
                            4'b1001 : seg <= 7'b0010000; // 9
                            4'b1010 : seg <= 7'b0001000; // A
                            4'b1011 : seg <= 7'b0000011; // b
                            4'b1100 : seg <= 7'b1000110; // C
                            4'b1101 : seg <= 7'b0100001; // d
                            4'b1110 : seg <= 7'b0000110; // E
                            4'b1111 : seg <= 7'b0001110; // F
                            default : seg <= 7'b0111111;
                        endcase
                    end
                    4'b0111: begin
                        case(digit4)
                            4'b0000 : seg <= 7'b1000000; // 0
                            4'b0001 : seg <= 7'b1111001; // 1
                            4'b0010 : seg <= 7'b0100100; // 2
                            4'b0011 : seg <= 7'b0110000; // 3
                            4'b0100 : seg <= 7'b0011001; // 4
                            4'b0101 : seg <= 7'b0010010; // 5
                            4'b0110 : seg <= 7'b0000010; // 6
                            4'b0111 : seg <= 7'b1111000; // 7
                            4'b1000 : seg <= 7'b0000000; // 8
                            4'b1001 : seg <= 7'b0010000; // 9
                            4'b1010 : seg <= 7'b0001000; // A
                            4'b1011 : seg <= 7'b0000011; // b
                            4'b1100 : seg <= 7'b1000110; // C
                            4'b1101 : seg <= 7'b0100001; // d
                            4'b1110 : seg <= 7'b0000110; // E
                            4'b1111 : seg <= 7'b0001110; // F
                            default : seg <= 7'b0111111;
                        endcase
                    end
                endcase
                end
                2'b11: begin
                    case(an)
                        4'b0111: seg <= 7'b1000010;
                        4'b1011: seg <= 7'b0100011;
                        4'b1101: seg <= 7'b0100011;
                        4'b1110: seg <= 7'b0100001;
                    endcase
                end
                2'b00: begin
                    case(an)
                        4'b1110: seg <= 7'b0000110;
                        4'b1101: seg <= 7'b0010010;
                        4'b1011: seg <= 7'b1000000;
                        4'b0111: seg <= 7'b1000111;
                    endcase
                end
                2'b01: begin
                    case(an)
                        4'b1110: seg <= 7'b0000110;
                        4'b1101: seg <= 7'b0010010;
                        4'b1011: seg <= 7'b1000000;
                        4'b0111: seg <= 7'b1000111;
                    endcase
                end
                
            endcase
         end
endmodule
