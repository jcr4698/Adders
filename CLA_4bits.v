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
    //wire [3:0] Sum;
    //wire Cout;
    assign C[0] = Cin;
    
    //// Propagates
    xor xor0(P[0], A[0], B[0]); // P0 = a0 ^ b0
    xor xor1(P[1], A[1], B[1]); // P1 = a1 ^ b1
    xor xor2(P[2], A[2], B[2]); // P2 = a2 ^ b2
    xor xor3(P[3], A[3], B[3]); // P3 = a3 ^ b3
    
    //// Carrys
    wire ab0, pc0;
    and and0(ab0, A[0], B[0]); // a0 * b0
    and and1(pc0, P[0], C[0]); // P0 * C0
    or or0(C[1], ab0, pc0); // C1
    
    wire ab1, pc1;
    and and2(ab1, A[1], B[1]); // a1 * b1
    and and3(pc1, P[1], C[1]); // P1 * C1
    or or1(C[2], ab1, pc1); // C2
    
    wire ab2, pc2;
    and and4(ab2, A[2], B[2]); // a2 * b2
    and and5(pc2, P[2], C[2]); // P2 * C2
    or or2(C[3], ab2, pc2); // C3
    
    wire ab3, pc3;
    and and6(ab3, A[3], B[3]); // a3 * b3
    and and7(pc3, P[3], C[3]); // P3 * C3
    or or3(C[4], ab3, pc3); // C4
    
    //// Sums
    xor xor4(S[0], P[0], C[0]); // S0
    xor xor5(S[1], P[1], C[1]); // S1
    xor xor6(S[2], P[2], C[2]); // S2
    xor xor7(S[3], P[3], C[3]); // S3
    
    // Module instantiation of register_logic 
    register_logic c5 (
        .clk(clk),
        .enable(enable),
        .Data({C[4],S[3:0]}),
        .Q(Q)
    );
    
endmodule
