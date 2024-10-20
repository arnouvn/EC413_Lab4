`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 10:23:07 PM
// Design Name: 
// Module Name: nbit_FA_Verif
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


module nbit_FA_Verif(c_out, sum, a, b, c_in);

    parameter n = 8;
    
    input  [n-1:0] a;
    input  [n-1:0] b;
    input  c_in;
    
    output [n-1:0] sum;
    output c_out;
    
    wire [n:0] sum_internal;
    
    assign sum_internal = a + b + c_in;
    assign sum = sum_internal[n-1:0];
    assign c_out = sum_internal[n];
    
endmodule
