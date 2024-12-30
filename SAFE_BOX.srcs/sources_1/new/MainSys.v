`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 06:03:24 PM
// Design Name: 
// Module Name: MainSys
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


module MainSys
(
    input clk,
    input CFsw,
    input [3:0] sw1, // input code
    input [3:0] sw2, // input code
    input [3:0] sw3, // input code
    input [3:0] sw4, // input code
    output [3:0] status, // L or U
    output [6:0] seg,
    output [3:0] an, // anable for the 7seg
    output [2:0] life, // led show out life
    output [4:0] cd, // countdown endtime
    output truth
);
    wire truthL;
    wire clk_out;
    
    divider(clk,clk_out);
    Display7seg(cd[0], truthL, clk, sw1, sw2, sw3, sw4, seg, an);
    counter(clk_out, !life[0] & (!truthL), cd);
    PasswordSys (CFsw, sw1, sw2, sw3, sw4, status, truth);
    lifeCounter(clk_out, CFsw, truth, life, truthL);

endmodule
