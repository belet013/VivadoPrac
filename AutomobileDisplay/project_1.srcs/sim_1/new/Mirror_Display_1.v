`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 10:22:14 PM
// Design Name: 
// Module Name: Mirror_Display_1
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


module tb_Mirror_Display_1(

    );
    
    reg [7:0] Temperature;
    reg [7:0] Average_mpg;
    reg [7:0] Instantaneous_mpg;
    reg [7:0] Miles_remaining;
    reg [1:0] SS;
    wire [7:0] Display;
    
Mirror_Display_1 U0(Temperature, Average_mpg, Instantaneous_mpg, Miles_remaining, SS, Display); //Instantiating the source file we earlier created
   
    initial begin                   // We'll check the simulation for a couple of combinations to see if we are getting the right output, 
        Temperature = 8'b0;         // here are some pre-defined values for sensors I came-up with
        Average_mpg = 8'b10011000;
        Instantaneous_mpg = 8'b00010010;
        Miles_remaining = 8'b11110000;
        SS = 2'b00;
        #100; // 100 ns delay
        
            Average_mpg = 8'b1001000;
            Instantaneous_mpg = 8'b10010010;
            Miles_remaining = 8'b00001111;
            SS = 2'b11;
       #1000; // 1 ms delay
    end
    
endmodule
