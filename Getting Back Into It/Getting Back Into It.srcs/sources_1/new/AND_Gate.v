`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dan Beletsky
// 
// Create Date: 09/12/2025 11:50:46 AM
// Design Name: 
// Module Name: AND_Gate
// Project Name: AND_Gate
// Target Devices: ARTIX-7
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


module AND_Gate(
    input A,
    input B,
    output outAND
    );
    
    assign outAND = A & B; //A anding with B
    
endmodule
