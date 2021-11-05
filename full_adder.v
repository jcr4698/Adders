`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UT ECE
// Engineer: Jan C. Rubio
// 
// Create Date: 11/03/2021 01:27:39 AM
// Design Name: Ripple Carry Adder
// Module Name: full_adder
// Project Name: Lab 5
// Target Devices: Basys3
// Description: Designing, simulating, and testing the Ripple Carry Adder
//
//////////////////////////////////////////////////////////////////////////////////


module full_adder(
    input A, B, Cin,
    output S, Cout
);

//// Carry-Out Bit
// AND
wire bc, ac, ab;
and and0(bc, B, Cin);
and and1(ac, A, Cin);
and and2(ab, A, B);
// OR
or or0(Cout, bc, ac, ab);
//////////////////

//// Sum Bit
// OR
xor xor0(S, A, B, Cin);

endmodule
