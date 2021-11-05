`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 12:19:00 AM
// Design Name: 
// Module Name: tb_RCA_4bits
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


module tb_RCA_4bits;

// inputs
reg clk;
reg enable;
reg [3:0] A;
reg [3:0] B;
reg Cin;

// outputs
wire [4:0] Q;

RCA_4bits u1(
    .clk(clk),
    .enable(enable),
    .A(A),
    .B(B),
    .Cin(Cin),
    .Q(Q)
);

initial
begin

enable = 0; // NOT pressed
clk = 0;
Cin = 0;
A = 4'b0000; // 0
B = 4'b0000; // 0 
#100 // SUM: 0 // Cout: 0

enable = 1; // pressed
A = 4'b0001; // 1
B = 4'b0101; // 5
#100 // SUM: 6 // Cout: 0

enable = 0; // NOT pressed
A = 4'b0001; // 1
B = 4'b0001; // 1
#100 // SUM: 6 // Cout: 0

enable = 1; // pressed
A = 4'b0111; // 7
B = 4'b0111; // 7
#100 // SUM: e // Cout = 0

enable = 0; // NOT pressed
A = 4'b0010;
B = 4'b0101; // 2 + 5 = 7
#100 // SUM: e // Cout = 0

enable = 1; // pressed
A = 4'b1000; // 8
B = 4'b0111; // 7
#100 // SUM: f // Cout = 0

enable = 1; // pressed
A = 4'b1100; // 12
B = 4'b0100; // 4
#100 // SUM: 0 // Cout = 1

enable = 1;
A = 4'b1000; // 8
B = 4'b1000; // 8
#100 // SUM: 0 // Cout = 1

enable = 1;
A = 4'b1001; // 9
B = 4'b1010; // 10
#100 // SUM: 3 // Cout = 1

enable = 1;
A = 4'b1111; // 15
B = 4'b1111; // 15
    // SUM: e // Cout = 1
end

// timing control
always
#1 clk = ~clk;

endmodule
