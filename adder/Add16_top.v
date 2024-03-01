/***************************************************
* File: Add16_top.v
* Author: Andrei Belov
* Class: EE 271
* Module: Add16_top
* Description: 16-bit Adder built with
*  4 instantiations of 4-bit Adders
****************************************************/

module Add16_top
    (
        input[15:0] A,
        input[15:0] B,
        input Cin,
        output Cout,
        output[15:0] Sum
    );
    wire Cin2, Cin3, Cin4; //intermediate Cin
    add4 add4_1(.Data1(A[3:0]), .Data2(B[3:0]), .Cin(Cin), .Cout(Cin2), .Sum(Sum[3:0]));
    add4 add4_2(.Data1(A[7:4]), .Data2(B[7:4]), .Cin(Cin2), .Cout(Cin3), .Sum(Sum[7:4]));
    add4 add4_3(.Data1(A[11:8]), .Data2(B[11:8]), .Cin(Cin3), .Cout(Cin4), .Sum(Sum[11:8]));
    add4 add4_4(.Data1(A[15:12]), .Data2(B[15:12]), .Cin(Cin4), .Cout(Cout), .Sum(Sum[15:12]));
endmodule
