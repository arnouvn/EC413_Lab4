`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 09:58:18 PM
// Design Name: 
// Module Name: MUX_Prelab
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


module MUX_Prelab(q, c_out, sel, clk, a, b, c_in);
    
    parameter n = 8;
    
    input sel;
    input clk;
    input [n-1:0] a, b;
    input c_in;
    
    output [n-1:0] q;
    output c_out;
    
    wire [n-1:0] AdderOut, NotOut;
    reg [n-1:0] choiceOutput;
    
    nbit_FA_str #(.n(n)) NbitAdder (
        .c_out(c_out),
        .sum(AdderOut),
        .a(a),
        .b(b),
        .c_in(c_in));
        
    nbit_not #(.n(n)) NbitNot (
        .in(a),
        .out(NotOut));
        
    nbit_dff #(.n(n)) NbitReg (
        .q(q),
        .d(choiceOutput),
        .clk(clk));
       
    always @ (*) begin
        if (sel == 1'b1) begin
            choiceOutput = AdderOut;
        end else begin
            choiceOutput = NotOut;
        end
    end
    
endmodule
