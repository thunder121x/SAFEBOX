`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 06:03:24 PM
// Design Name: 
// Module Name: PasswordSys
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


//module PasswordSys
//(
//    input [3:0] sw, // input 5-bit code password
//    output [1:0] status // Lock or Unlock
//);
    
//    parameter code = 4'b1100; // password to Unlock safe
    
//    assign status[1] = ~(sw[0]^code[0]) & ~(sw[1]^code[1]) & ~(sw[2]^code[2]) & ~(sw[3]^code[3]);
//    assign status[0] = ~status[1];
    
//endmodule
//module PasswordSys
//(
//    input CFsw,
//    input [3:0] sw, // input 5-bit code password
//    output [1:0] status, // Lock or Unlock
//    output truthvalue
//);
//    parameter code = 4'b1100; // password to Unlock safe
    
//    assign status[1] = ~(sw[0]^code[0]) & ~(sw[1]^code[1]) & ~(sw[2]^code[2]) & ~(sw[3]^code[3]) & CFsw;
//    assign status[0] = ~status[1] & CFsw;
//    assign truthvalue = status[1];
    
    
//endmodule

module PasswordSys
(
    input CFsw,
    input [3:0] sw1, // input 5-bit code password
    input [3:0] sw2, // input 5-bit code password
    input [3:0] sw3, // input 5-bit code password
    input [3:0] sw4, // input 5-bit code password
    output [3:0] stat, // Lock or Unlock
    output reg truth
//    output reg truthvalue
);
    parameter code1 = 4'b1100; // password to Unlock safe C
    parameter code2 = 4'b1010; // password to Unlock safe A
    parameter code3 = 4'b0001; // password to Unlock safe 1
    parameter code4 = 4'b1100; // password to Unlock safe C
    wire truthvalue;
    assign stat[0] =  ~(sw1[0]^code1[0]) & ~(sw1[1]^code1[1]) & ~(sw1[2]^code1[2]) & ~(sw1[3]^code1[3]) & CFsw;
    assign stat[1] =  ~(sw2[0]^code2[0]) & ~(sw2[1]^code2[1]) & ~(sw2[2]^code2[2]) & ~(sw2[3]^code2[3]) & CFsw;
    assign stat[2] =  ~(sw3[0]^code3[0]) & ~(sw3[1]^code3[1]) & ~(sw3[2]^code3[2]) & ~(sw3[3]^code3[3]) & CFsw;
    assign stat[3] =  ~(sw4[0]^code4[0]) & ~(sw4[1]^code4[1]) & ~(sw4[2]^code4[2]) & ~(sw4[3]^code4[3]) & CFsw;
    assign truthvalue = stat[0] & stat[1] & stat[2] & stat[3];
    always@(*) if (truthvalue) truth <= 1;
endmodule