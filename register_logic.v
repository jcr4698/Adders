`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// 
// Create Date: 11/03/2021 01:27:39 AM
// Design Name: RCA/CLA Register Logic
// Module Name: register_logic
// Project Name: Lab 5
// Target Devices: Basys3
// Description: Signal and enable for Adders
//
//////////////////////////////////////////////////////////////////////////////////


module register_logic(
    input clk,
    input enable,
    input [4:0] Data,
    output reg [4:0] Q
);

reg [4:0] REG;

always @(posedge clk)
begin
    if(enable == 1'b1)
        REG[4:0] <= Data;
end

always @(*)
begin
    Q <= REG[4:0];
end

endmodule
