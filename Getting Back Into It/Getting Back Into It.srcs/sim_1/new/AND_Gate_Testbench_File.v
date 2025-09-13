`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 03:51:40 PM
// Design Name: 
// Module Name: AND_Gate_Testbench_File
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


module AND_Gate_Testbench_File(

    );
    
    reg aa,bb;
        wire out1;
        AND_Gate U1(aa,bb,out1); //aa as A, and bb as B, out1 as outAND
        initial begin 
        aa=0; //resetting it to zero
        bb=0;
        #100; //100ns delay
        bb=1;
        #100; //100ns delay
        aa=1;
        bb=0;
        #100; //100ns delay
        bb=1;
        end
endmodule
