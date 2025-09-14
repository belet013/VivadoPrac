`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2025 09:54:02 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk_fpga, //100Mhz FPGA clock
    input reset,    //external reset (connects to push button)
    output [6:0] seg, //seven segment display
    output [3:0] an,  //LED segment enabler
    output led           //LED
    );
    
    parameter max_count = 100_000_000-1; //max count value
    wire counter_en;
    reg [26:0] counter_100M; //to count from 0-99,999,999
    reg [3:0] counter_10; //count from 0 to 9
    reg wrap_pulse
    
    //only turn on the first seven segment display
    assign an=4'b1110; //active low logic
    
    //instantiate the display module
    //counter_10 signal is connected to the digit port
    //seg signal is connected ot the seven_seg port
    
    Display_Seven_Segment DSS(counter_10,seg);
    
    //creating a counter to divide the 100 Mhz FPGA clock to 1 Hz
    
    always @(posedge clk_fpga or posedge reset) begin
    if (reset) begin
        counter_100M <= 27'd0;
        wrap_pulse   <= 1'b0;
    end else if (counter_100M == max_count) begin
        counter_100M <= 27'd0;
        wrap_pulse   <= 1'b1;     // one-cycle pulse on wrap
    end else begin
        counter_100M <= counter_100M + 1'b1;
        wrap_pulse   <= 1'b0;
    end
end

wire counter_en = wrap_pulse;      // use this in the decade counter
    
    //create a signal that is active every 100,000,000 clocks
    assign counter_en = counter_100M == 0; //enables counter every 100M clocks
    //creating a counter to cont from 0 to 9 at a frequency of 1 Hz
    
    always @(posedge clk_fpga, posedge reset)
    if(reset)
    counter_100M <= 0;
    else if (counter_en)
    if (counter_10 == 9)
    counter_10 <= 0;
    else counter_10 <= counter_10 + 1'b1;
    
    //flash an LED every 10 seconds
    assign led = counter_10 == 9;
endmodule
