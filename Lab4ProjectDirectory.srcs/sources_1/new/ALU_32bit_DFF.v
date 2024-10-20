`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 09:40:22 PM
// Design Name: 
// Module Name: ALU_32bit_DFF
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


module ALU_32bit_DFF(q,R2,R3,ALUOp,clk);

    parameter WIDTH = 32;
    //Inputs
    input signed [WIDTH-1:0] R2;
    input signed [WIDTH-1:0] R3;
    input [2:0] ALUOp;
    input clk;
    
    //Outputs
    output [WIDTH-1:0] q;
    wire [WIDTH-1:0] R1_to_reg; //really this is the ouput for R1 which will be the input for the register
    
    ALU_32bit #(.WIDTH(WIDTH)) ALU (
        .R1(R1_to_reg), //ouput of ALU
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp)
    );
    
    nbit_dff #(.n(WIDTH)) Register( 
        .q(q),
        .d(R1_to_reg), //input to dff
        .clk(clk)
    );
    
    
endmodule
