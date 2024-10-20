`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 01:57:57 PM
// Design Name: 
// Module Name: nbit_FA_str
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


module nbit_FA_str(c_out, sum, a, b, c_in);

parameter n = 8;

input [n-1:0] a, b;
input c_in;
output [n-1:0] sum;
output c_out;

wire [n:0] carry;
assign carry[0] = c_in;
assign c_out = carry[n];

genvar i;
generate 
    for (i = 0; i < n; i = i + 1) begin
        FA_str Adder1Bit (carry[i+1], sum[i], a[i], b[i], carry[i]);
    end
endgenerate

endmodule
