`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// 
// Create Date: 11/04/2021 05:14:11 AM
// Design Name: Carry Lookahead Adder
// Module Name: CLA_4bits
// Project Name: Lab 5
// Target Devices: Basys3
// Description: Designing the Carry Lookahead Adder
//
//////////////////////////////////////////////////////////////////////////////////


module CLA_4bits(
    input clk,
    input enable,
    input [3:0] A,B,
    input Cin,
    output [4:0] Q // load register, should contain the 4 sum bits and Cout
    );
    
    wire [3:0] G, P, S; // Generate, Propagate, Sum results here
    wire [4:0] C; // Carry bits
    assign C[0] = Cin;
    
    // Generate
    assign G[0] = A[0] & B[0];
    assign G[1] = A[1] & B[1];
    assign G[2] = A[2] & B[2];
    assign G[3] = A[3] & B[3];
    
    // Propagate
    assign P[0] = A[0] ^ B[0];
    assign P[1] = A[1] ^ B[1];
    assign P[2] = A[2] ^ B[2];
    assign P[3] = A[3] ^ B[3];
    
    // Carrys
    assign C[1] = (P[0] & C[0]) | G[0];
    assign C[2] = (P[1]&P[0] & C[0]) | (P[1] & G[0]) | G[1];
    assign C[3] = (P[2]&P[1]&P[0] & C[0]) | (P[2]&P[1] & G[0]) | (P[2] & G[1]) | G[2];
    assign C[4] = (P[3]&P[2]&P[1]&P[0] & C[0]) | (P[3]&P[2]&P[1] & G[0]) | (P[3]&P[2] & G[1]) | (P[3] & G[2]) | G[3];
    
    // Sums
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    
    // Module instantiation of register_logic 
    register_logic c5 (
        .clk(clk),
        .enable(enable),
        .Data({C[4],S[3:0]}),
        .Q(Q)
    );
    
endmodule
