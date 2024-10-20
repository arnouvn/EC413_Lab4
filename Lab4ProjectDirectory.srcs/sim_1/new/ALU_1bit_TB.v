`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 10:47:53 PM
// Design Name: 
// Module Name: ALU_1bit_TB
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


module ALU_1bit_TB();

    // Inputs
    reg R2;
    reg R3;
    reg C_in;
    reg [2:0] ALUOp;
    
    // Outputs
    wire R1;
    wire c_out;
    
    ALU_1bit uut (
        .c_out(c_out),
        .R1(R1),
        .ALUOp(ALUOp),
        .R2(R2),
        .R3(R3),
        .C_in(C_in)
    );
    
    initial begin
        R2 = 0;
        R3 = 0;
        C_in = 0;
        ALUOp = 3'b000;
        
        $monitor("Time = %0t | R2 = %b | R3 = %b | C_in = %b | ALUOp = %b | R1 = %b | c_out = %b", $time, R2, R3, C_in, ALUOp, R1, c_out);
        
        // MOV operation
        #10;
        R2 = 1; ALUOp = 3'b000;
        #10;
        R2 = 0; ALUOp = 3'b000;
        #10;
        
        //NOT operation
        R2 = 1; ALUOp = 3'b001;
        #10;
        R2 = 0; ALUOp = 3'b001;
        #10;
        
        //ADD operation 
        R2 = 1; R3 = 1; C_in = 0; ALUOp = 3'b010;
        #10;
        R2 = 1; R3 = 0; C_in = 1; ALUOp = 3'b010;
        #10;
        
        //SUB operation
        R2 = 1; R3 = 1; C_in = 0; ALUOp = 3'b011;
        #10;
        R2 = 1; R3 = 0; C_in = 0; ALUOp = 3'b011;
        #10;
        
        //OR operation
        R2 = 1; R3 = 0; ALUOp = 3'b100;
        #10;
        R2 = 0; R3 = 1; ALUOp = 3'b100;
        #10;
        R2 = 1; R3 = 1; ALUOp = 3'b100;
        #10;
        
        //AND operation
        R2 = 1; R3 = 0; ALUOp = 3'b101;
        #10;
        R2 = 1; R3 = 1; ALUOp = 3'b101;
        #10;
        R2 = 0; R3 = 0; ALUOp = 3'b101;
        #10;
        
        $finish;
    end
    
    
endmodule
