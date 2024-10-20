`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 08:59:31 PM
// Design Name: 
// Module Name: MUX_Prelab_TB
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


module MUX_Prelab_TB();

    parameter bitwidth = 4;
    
    reg sel;
    reg clk;
    reg [bitwidth-1:0] a, b;
    reg c_in;
    
    wire [bitwidth-1:0] q;
    wire c_out;
    
    wire [bitwidth-1:0] q_verif;
    wire c_out_verif;
    reg error_flag;
    
    MUX_Prelab #(.n(bitwidth)) UUT (
        .q(q),
        .c_out(c_out),
        .sel(sel),
        .clk(clk),
        .a(a),
        .b(b),
        .c_in(c_in)
    );
    
    MUX_Prelab_verif #(.n(bitwidth)) verification (
        .q(q_verif),
        .c_out(c_out_verif),
        .sel(sel),
        .a(a),
        .b(b),
        .c_in(c_in)
    );
    
    always begin
        #5 clk = ~clk; // 10ns
    end
    
    initial begin
        
        clk = 0;
        sel = 0;
        a = 0;
        b = 0;
        c_in = 0;
        error_flag = 0;
        #10;
        
        // test NOT
        sel = 0;
        a = 8'b1010;
        #10;
        check_results();
        
        //addition
        sel = 1;
        a = 8'b0011;
        b = 8'b0011;
        c_in = 0;
        #10;
        check_results();
        
        // addition with carry in
        sel = 1;
        a = 8'b0101;
        b = 8'b0011;
        c_in = 1;
        #10;
        check_results();
        
        // addition with forced carry-out
        sel = 1;
        a = 8'b1110;
        b = 8'b1110;
        c_in = 0;
        #10;
        check_results();
        
        $finish;
    end
    
    task check_results;
        begin
            if (q !== q_verif || c_out !== c_out_verif ) begin
                error_flag = 1;
            end else begin
                error_flag = 0;
            end
        end
    endtask
    
    // Monitor signals
    initial begin
        $monitor("Time = %0t, sel = %b, a = %b, b = %b, c_in = %b, q = %b, c_out = %b", $time, sel, a, b, c_in, q, c_out);
    end


endmodule
