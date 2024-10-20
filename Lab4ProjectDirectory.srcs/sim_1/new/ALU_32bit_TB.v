`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 12:06:14 AM
// Design Name: 
// Module Name: ALU_32bit_TB
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


module ALU_32bit_TB();
    
    parameter WIDTH = 32;

    // Inputs
    reg signed [WIDTH-1:0] R2;
    reg signed [WIDTH-1:0] R3;
    reg [2:0] ALUOp;

    // Outputs
    wire signed [WIDTH-1:0] R1;
    wire signed [WIDTH-1:0] R1_behavioral;
    reg error_flag;

    // Instantiate the ALU_32bit module
    ALU_32bit #(.WIDTH(WIDTH)) uut (
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp),
        .R1(R1)
    );
    
    ALU_behavioral #(.WIDTH(WIDTH)) uut_verif (
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp),
        .R1(R1_behavioral)
    );


    // Test vectors
    initial begin
        // Display the output for observation
        $monitor($time, " ALUOp=%b, R2=%d, R3=%d, R1=%d, R1_behavioral=%d, Error=%b", ALUOp, R2, R3, R1, R1_behavioral, error_flag);

        // Test all ALU operations
        ALUOp = 3'b000; R2 = 32'd5; R3 = 32'd3; #10; // MOV operation
        check_error;
        ALUOp = 3'b001; R2 = 32'd5; R3 = 32'd0; #10; // NOT operation
        check_error;
        ALUOp = 3'b100; R2 = 32'd5; R3 = 32'd3; #10; // OR operation
        check_error;
        ALUOp = 3'b101; R2 = 32'd5; R3 = 32'd3; #10; // AND operation
        check_error;

        // Test all ALU operations
        ALUOp = 3'b000; R2 = 4'd3; R3 = 4'd2; #10; // MOV operation
        check_error;
        ALUOp = 3'b001; R2 = 4'd3; R3 = 4'd0; #10; // NOT operation
        check_error;
        ALUOp = 3'b100; R2 = 4'd3; R3 = 4'd1; #10; // OR operation
        check_error;
        ALUOp = 3'b101; R2 = 4'd3; R3 = 4'd1; #10; // AND operation
        check_error;

        // Thorough testing of signed addition and subtraction
        // Test ADD operation without overflow
        $display("%t: Testing ADD operation without overflow", $time);
        ALUOp = 3'b010; R2 = 4'sd3; R3 = 4'sd2; #10;
        check_error;
        ALUOp = 3'b010; R2 = 4'sd7; R3 = -4'sd1; #10;
        check_error;

        // Test ADD operation with overflow
        $display("%t: Testing ADD operation with overflow", $time);
        ALUOp = 3'b010; R2 = 4'sd7; R3 = 4'sd2; #10; // Overflow case
        check_error;
        ALUOp = 3'b010; R2 = 4'sd4; R3 = 4'sd4; #10; // Overflow case
        check_error;
        
        // Test SUB operation without overflow
        $display("%t: Testing SUB operation without overflow", $time);
        ALUOp = 3'b011; R2 = -4'sd3; R3 = -4'sd2; #10;
        check_error;
        ALUOp = 3'b011; R2 = 4'sd3; R3 = 4'sd2; #10;
        check_error;

        // Test SUB operation with overflow
        $display("%t: Testing SUB operation with overflow", $time);
        ALUOp = 3'b011; R2 = -4'sd8; R3 = 4'sd1; #10; // Overflow case
        check_error;
        ALUOp = 3'b011; R2 = 4'sd7; R3 = -4'sd1; #10; // Overflow case
        check_error;

        // End simulation
        $finish;
    end
    
    task check_error;
        begin
            if (R1 !== R1_behavioral) begin
                error_flag = 1;
                $display("%t: Error detected: R1 = %d, R1_behavioral = %d", $time, R1, R1_behavioral);
            end else begin
                error_flag = 0;
            end
        end
    endtask

endmodule