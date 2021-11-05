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

    wire temp_Cout;
    
    // Module instantiation of full_adder
    full_adder fa0(.A(A[0]), .B(B[0]), .Cin(Cin), .S(Q[0]), .Cout(temp_Count));
    full_adder fa1(.A(A[1]), .B(B[1]), .Cin(temp_Cout), .S(Q[1]), .Cout(temp_Count));
    full_adder fa2(.A(A[2]), .B(B[2]), .Cin(temp_Cout), .S(Q[2]), .Cout(temp_Count));
    full_adder fa3(.A(A[3]), .B(B[3]), .Cin(temp_Cout), .S(Q[3]), .Cout(temp_Count));
    assign Q[4] = temp_Cout;
    
    // Module instantiation of register_logic 
    register_logic s0(
        .clk(clk),
        .enable(enable),
        .Data(Q),
        
    
endmodule
