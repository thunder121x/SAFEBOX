`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 04:00:14 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk_in,
    input enable,
    output reg[4:0] cd
  );
    reg [1:0]p;
    initial p = 2'b00;
    initial cd = 5'b11111;
    always@(posedge clk_in) begin
        if(enable)  begin
            if(p[0] & p[1]) cd <= cd >> 1;
            p <= p + 1;
        end
    end
endmodule
