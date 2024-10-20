`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2024 09:21:38 PM
// Design Name: 
// Module Name: nbit_FA_dff_TB
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


module nbit_FA_dff_TB();

    parameter bitwidth = 4;
    
    // inputs
    reg [bitwidth-1:0] a, b;
    reg c_in;
    reg clk;
    
    // outputs
    wire [bitwidth-1:0] q;
    wire c_out;
    
    // Verification outputs
    wire [bitwidth-1:0] sum_verif;
    wire c_out_verif;
    
    reg error_flag;
    
    nbit_FA_dff #(.n(bitwidth)) NbitSystem(
        .q(q),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in),
        .clk(clk));
        
    nbit_FA_Verif #(.n(bitwidth)) Verification(
        .c_out(c_out_verif),
        .sum(sum_verif),
        .a(a),
        .b(b),
        .c_in(c_in));
        
    // clock generation
    always begin
        #5 clk = ~clk; // Clock period of 10ns
    end
    
    initial begin
        
        clk = 0;
        a = 0;
        b = 0;
        c_in = 0;
        
        #10;
        
        // Test case 1: Add 3 + 2
        a = 4'b0011; // 3 in binary
        b = 4'b0010; // 2 in binary
        c_in = 0;
        #10;
        
        check_results();
        
        // Test case 2: Add 7 + 1 with carry-in
        a = 4'b0111; // 7 in binary
        b = 4'b0001; // 1 in binary
        c_in = 1;
        #10;
        
        check_results();
        
        // Test case 3: Add 15 + 1 with carry-in
        a = 4'b1111; // 15 in binary
        b = 4'b0001; // 1 in binary
        c_in = 1;
        #10;
        
        check_results();
        
    end
    
    task check_results;
        begin
            if (q !== sum_verif) begin
                error_flag = 1;
                $display("Error at time %0t: Expected q = %b, Got q = %b", $time, sum_verif, q);
            end else begin
                error_flag = 0;
            end
        end
    endtask
    
    initial begin
        $monitor("Time = %0t, a = %b, b = %b, c_in = %b, q = %b, c_out = %b, sum_verif = %b, c_out_verif = %b, error_flag = %b", $time, a, b, c_in, q, c_out, sum_verif, c_out_verif, error_flag);
    end
        
endmodule











