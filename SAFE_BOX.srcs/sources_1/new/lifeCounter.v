`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 04:55:02 PM
// Design Name: 
// Module Name: lifeCounter
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


module lifeCounter(
    input clk_in,
    input cf,
    input truthval,
    output reg[2:0] life,
    output reg truth
  );
    initial truth = 0;
    initial life = 3'b111;
    always@(posedge clk_in) begin
        if(cf & (!truthval)) begin
            life <= life >> 1;
        end 
        if(cf & truthval) begin
            truth <= 1;
        end 
    end
endmodule
