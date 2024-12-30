`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2023 06:55:41 PM
// Design Name: 
// Module Name: lifeCheck
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


module lifeCheck(
//    input CFsw,
    input truthvalue,
    input lifepointBf,
    output reg lifepoint
    ); 
    always@(CFsw)
//        lifepoint <= lifepointBf - (truthvalue & CFsw);
        lifepoint <= lifepointBf - (truthvalue);
endmodule
