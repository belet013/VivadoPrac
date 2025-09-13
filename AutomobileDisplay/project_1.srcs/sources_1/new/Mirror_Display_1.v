`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 10:01:16 PM
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


module Mirror_Display_1(
    input wire [7:0] Temperature, //All 4 sensors declared as input
    input wire [7:0] Average_mpg,
    input wire [7:0] Instantaneous_mpg,
    input wire [7:0] Miles_remaining,
    input wire [1:0] SS, //Selector Switches x,y as shown in block diagram
    output reg[7:0] Display //Output Mirror Display
    );
    
always @(*) begin
    Display = 8'h00;
    case(SS)
        2'b00: Display = Temperature; //If SS is set to 00, then the Display is equal to data from sensor that is taking temperature reading
        2'b01: Display = Average_mpg;
        2'b10: Display = Instantaneous_mpg;
        2'b11: Display = Miles_remaining;
    endcase
end
endmodule
