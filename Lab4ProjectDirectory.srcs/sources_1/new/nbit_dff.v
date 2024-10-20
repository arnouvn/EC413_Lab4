`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 01:45:11 PM
// Design Name: 
// Module Name: nbit_dff
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


module nbit_dff(q, d, clk);

parameter n = 8;

input [n-1:0] d;
input clk;
output [n-1:0] q;

genvar i;

generate 
    for (i = 0; i < n; i = i+1) begin: registerblk
        dff DflipFlop(q[i], d[i], clk);
    end
endgenerate

endmodule
