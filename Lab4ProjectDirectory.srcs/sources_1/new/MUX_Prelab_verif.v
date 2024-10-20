`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 09:44:59 PM
// Design Name: 
// Module Name: MUX_Prelab_verif
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


module MUX_Prelab_verif(q, c_out, sel, a, b, c_in);
    
    parameter n = 8;
    
    input sel;
    input [n-1:0] a;
    input [n-1:0] b;
    input c_in;
    output reg [n-1:0] q;
    output reg c_out;
    
    always @ (*) begin
        q = 0;
        c_out = 0;
        
        if (sel == 1'b0) begin
            q = ~a;
        end else if (sel == 1'b1) begin
            {c_out, q} = a + b + c_in;
        end
    end
    
endmodule
