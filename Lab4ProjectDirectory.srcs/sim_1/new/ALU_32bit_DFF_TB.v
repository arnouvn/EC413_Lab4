`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2024 09:41:21 PM
// Design Name: 
// Module Name: ALU_32bit_DFF_TB
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


module ALU_32bit_DFF_TB();

    parameter WIDTH = 32;

    //Inputs
    reg signed [WIDTH-1:0] R2;
    reg signed [WIDTH-1:0] R3;
    reg [2:0] ALUOp;
    reg clk;
    
    //Ouput
    wire [WIDTH-1:0] q;
    
    wire [WIDTH-1:0] R1_behavioral;
    reg error_flag;
    
    //Instantiate ALU_top
    ALU_32bit_DFF #(.WIDTH(WIDTH)) ALUTop(
        .q(q),
        .R3(R3),
        .R2(R2),
        .ALUOp(ALUOp),
        .clk(clk)
        );
       
    ALU_behavioral #(.WIDTH(WIDTH)) ALU(
        .R2(R2),
        .R3(R3),
        .ALUOp(ALUOp),
        .R1(R1_behavioral)
    );
     
 
   
    
    initial begin
        error_flag = 0;
        $monitor($time, " ALUOp = %b, R2 = %d, R3 = %d, q = %d, R1_behavioral = %d, Error = %b", ALUOp, R2, R3, q, R1_behavioral, error_flag); // Displaying results

        #1 clk = 1;
        #40 ALUOp = 3'b000; R2 = 32'd10; R3 = 32'd0; // testing mov
        check_error;
        #40 ALUOp = 3'b010; R2 = 32'd30; R3 = 32'd20; // testing add for small values
        check_error;
        #40 ALUOp = 3'b010; R2 = 32'd1500000; R3 = 32'd400000; // testing add for large values w/o overflow
        check_error;
        #40 ALUOp = 3'b010; R2 = 32'd4294967295; R3 = 32'd1; // testing add for large values w overflow
        check_error;
        #40 ALUOp = 3'b011; R2 = 32'd30; R3 = 32'd20; // testing sub for small values
        check_error;
        #40 ALUOp = 3'b011; R2 = 32'd1500000; R3 = 32'd400000; // testing sub for large values
        check_error;
        #40 ALUOp = 3'b011; R2 = 32'd15; R3 = 32'd0; // subtracting 0
        check_error;
        #40 ALUOp = 3'b011; R2 = 32'd100; R3 = 32'd100; // subtracting same value
        check_error;
        #40 ALUOp = 3'b011; R2 = 32'd10; R3 = 32'd20; // testing sub with negative value
        check_error;
        #40 ALUOp = 3'b001; R2 = 32'd0; R3 = 32'd0; // testing not
        check_error;
        #40 ALUOp = 3'b100; R2 = 32'd12; R3 = 32'd15; // testing or
        check_error;
        #40 ALUOp = 3'b101; R2 = 32'd0; R3 = 32'd15; // testing and
        check_error;

        // End simulation
        $finish;
    end
  
    always begin
        #15 clk = ~clk;
    end

    // Task to check for errors between UUT and behavioral model
    task check_error;
        begin
            if (q !== R1_behavioral) begin
                error_flag = 1;
                $display("%t: Error detected: q = %d, R1_behavioral = %d", $time, q, R1_behavioral);
            end else begin
                error_flag = 0;
            end
        end
    endtask
    
endmodule 