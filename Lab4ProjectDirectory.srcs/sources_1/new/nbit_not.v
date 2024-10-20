`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 09:53:55 PM
// Design Name: 
// Module Name: nbit_not
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


module nbit_not(
    out,
    in);
    
    parameter n = 8;
    
    input [n-1:0] in;
    output reg [n-1:0] out;
    
    always @ (*) begin
        out <= ~in;
    end
    
endmodule





