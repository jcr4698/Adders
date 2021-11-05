`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 05:11:38 PM
// Design Name: 
// Module Name: tb_CLA_4bits
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

module tb_CLA_4bits;

// inputs
reg clk;
reg enable;
reg [3:0] A;
reg [3:0] B;
reg Cin;

// outputs
wire [4:0] Q;

CLA_4bits u1(
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
A = 4'b0000; // 0
B = 4'b0101; // 5
#100 // SUM: 5 // Cout: 0

enable = 0; // NOT pressed
A = 4'b0001; // 1
B = 4'b0111; // 7
#100 // SUM: 8 // Cout: 0

enable = 1; // pressed
A = 4'b0101; // 5
B = 4'b0111; // 7
#100 // SUM: c // Cout = 0

enable = 0; // NOT pressed
A = 4'b0010; // 2
B = 4'b0101; // 5
#100 // SUM: 7 // Cout = 0

enable = 1; // pressed
A = 4'b1000; // 8
B = 4'b0111; // 7
#100 // SUM: f // Cout = 0

enable = 1; // pressed
A = 4'b1001; // 9
B = 4'b0100; // 4
#100 // SUM: d // Cout = 0

enable = 1;
A = 4'b1000; // 8
B = 4'b1000; // 8
#100 // SUM: 0 // Cout = 1

enable = 1;
A = 4'b1101; // 13
B = 4'b1010; // 10
#100 // SUM: 7 // Cout = 1

enable = 1;
A = 4'b1110; // 14
B = 4'b1111; // 15
    // SUM: d // Cout = 1
end

// timing control
always
#1 clk = ~clk;
endmodule
