`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 02:08:43 PM
// Design Name: 
// Module Name: nbit_FA_dff
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


module nbit_FA_dff(
    q, 
    c_out,
    a, 
    b, 
    c_in, 
    clk
    );

    parameter n = 8;

    input [n-1:0] a, b;
    input c_in;
    input clk;

    output [n-1:0] q;
    output c_out;
    
    wire [n-1:0] sum_to_reg;
    
    nbit_FA_str #(.n(n)) NbitAdder (
        .c_out(c_out),
        .sum(sum_to_reg),
        .a(a),
        .b(b),
        .c_in(c_in));
        
    nbit_dff #(.n(n)) NbitReg (
        .q(q),
        .d(sum_to_reg),
        .clk(clk));
        
endmodule
