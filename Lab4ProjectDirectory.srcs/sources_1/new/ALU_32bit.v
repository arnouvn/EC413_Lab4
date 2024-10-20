`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 12:41:22 AM
// Design Name: 
// Module Name: ALU_32bit
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


module ALU_32bit #(
    parameter WIDTH = 32
    )(
    input signed [WIDTH-1:0] R2,      
    input signed [WIDTH-1:0] R3,      
    input [2:0] ALUOp,                
    output [WIDTH-1:0] R1
    );
    
    wire [WIDTH:0] carry;
    wire [WIDTH-1:0] R1_internal;
    
    reg overflow;
    
    assign carry[0] = (ALUOp == 3'b011) ? 1'b1 : 1'b0;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : ALU_GEN
            ALU_1bit alu_slice (
                .c_out(carry[i+1]),           
                .R1(R1[i]),                  
                .ALUOp(ALUOp),               
                .R2(R2[i]),                  
                .R3(R3[i]),                  
                .C_in(carry[i])              
            );
        end
    endgenerate
    
    
endmodule
