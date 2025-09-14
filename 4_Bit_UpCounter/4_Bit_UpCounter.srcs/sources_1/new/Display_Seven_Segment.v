`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 09:41:09 PM
// Design Name: 
// Module Name: Display_Seven_Segment
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


module Display_Seven_Segment(
    input [3:0] digit, //4-bit value to be displayed as 0 to 9
    output reg [6:0] seven_reg //seven_segment display (cathodes)
    ); //reg type required for the always constant
    
    //creating a set of constraints for the seven segments
    parameter zero = 7'b100_0000;
    parameter one = 7'b111_1001;
    parameter two = 7'b010_0100;
    parameter three = 7'b011_0000;
    parameter four = 7'b001_1001;
    parameter five = 7'b001_0010;
    parameter six = 7'b000_0010;
    parameter seven = 7'b111_1000;
    parameter eight = 7'b000_0000;
    parameter nine = 7'b001_0000;
    
    //using CASE keyword/statement
    //note that seven_seg must be declared as a reg type\\
    
    always @(digit)
    case(digit)
    0: seven_reg = zero; 
    1: seven_reg = one;
    2: seven_reg = two;
    3: seven_reg = three;
    4: seven_reg = four;
    5: seven_reg = five;
    6: seven_reg = six;
    7: seven_reg = seven;
    8: seven_reg = eight;
    9: seven_reg = nine;
    default: seven_reg = zero;
    endcase
endmodule
