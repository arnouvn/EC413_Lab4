`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 03:25:31 AM
// Design Name: 
// Module Name: TEST_TB
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


module TEST_TB(

    );
    
    parameter WIDTH = 4;

    // Inputs
    reg signed [WIDTH-1:0] R2;
    reg signed [WIDTH-1:0] R3;
    reg [2:0] ALUOp;

    // Outputs
    wire signed [WIDTH-1:0] R1;

    // Instantiate the ALU_behavioral module
    ALU_behavioral #(.WIDTH(WIDTH)) uut (
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp),
        .R1(R1)
    );

    // Test vectors
    initial begin
        // Display the output for observation
        $monitor($time, " ALUOp=%b, R2=%d, R3=%d, R1=%d", ALUOp, R2, R3, R1);

        // Test all ALU operations
        ALUOp = 3'b000; R2 = 4'd3; R3 = 4'd2; #10; // MOV operation
        ALUOp = 3'b001; R2 = 4'd3; R3 = 4'd0; #10; // NOT operation
        ALUOp = 3'b100; R2 = 4'd3; R3 = 4'd1; #10; // OR operation
        ALUOp = 3'b101; R2 = 4'd3; R3 = 4'd1; #10; // AND operation

        // Thorough testing of signed addition and subtraction
        // Test ADD operation without overflow
        $display("%t: Testing ADD operation without overflow", $time);
        ALUOp = 3'b010; R2 = 4'sd3; R3 = 4'sd2; #10;
        ALUOp = 3'b010; R2 = 4'sd7; R3 = -4'sd1; #10;

        // Test ADD operation with overflow
        $display("%t: Testing ADD operation with overflow", $time);
        ALUOp = 3'b010; R2 = 4'sd7; R3 = 4'sd2; #10; // Overflow case
        ALUOp = 3'b010; R2 = 4'sd4; R3 = 4'sd4; #10; // Overflow case

        // Test SUB operation without overflow
        $display("%t: Testing SUB operation without overflow", $time);
        ALUOp = 3'b011; R2 = -4'sd3; R3 = -4'sd2; #10;
        ALUOp = 3'b011; R2 = 4'sd3; R3 = 4'sd2; #10;

        // Test SUB operation with overflow
        $display("%t: Testing SUB operation with overflow", $time);
        ALUOp = 3'b011; R2 = -4'sd8; R3 = 4'sd1; #10; // Overflow case
        ALUOp = 3'b011; R2 = 4'sd7; R3 = -4'sd1; #10; // Overflow case

        // End simulation
        $finish;
    end

endmodule
