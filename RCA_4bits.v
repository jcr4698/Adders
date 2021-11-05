`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 01:24:25 AM
// Design Name: 
// Module Name: RCA_4bits
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


module RCA_4bits(
    input clk,
    input enable,
    input [3:0] A,B,
    input Cin,
    output [4:0] Q
    );

    wire carry0, carry1, carry2;
    wire [4:0] sOut;
    
    // Module instantiation of full_adder
    full_adder c1 (.A(A[0]), .B(B[0]), .Cin(Cin), .S(sOut[0]), .Cout(carry0));
    full_adder c2 (.A(A[1]), .B(B[1]), .Cin(carry0), .S(sOut[1]), .Cout(carry1));
    full_adder c3 (.A(A[2]), .B(B[2]), .Cin(carry1), .S(sOut[2]), .Cout(carry2));
    full_adder c4 (.A(A[3]), .B(B[3]), .Cin(carry2), .S(sOut[3]), .Cout(sOut[4]));
    
    // Module instantiation of register_logic 
    register_logic c5 (
        .clk(clk),
        .enable(enable),
        .Data(sOut),
        .Q(Q)
    );
    
endmodule
