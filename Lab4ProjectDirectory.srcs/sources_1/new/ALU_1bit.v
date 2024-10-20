`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2024 10:40:40 PM
// Design Name: 
// Module Name: ALU_1bit
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


module ALU_1bit(c_out,R1,ALUOp,R2,R3,C_in);
    
    output c_out;
    output reg R1; // ouput of the ALU
    input R2,R3; // two inputs of the ALU
    input C_in; // need carry in for adder and subtractor
    input [2:0] ALUOp; // select input

    wire and_out, or_out, not_R2, add_sub_out; // these are ouputs for functions we're implementing
    wire c_out_add_sub; //carry out ouputs
    wire R3_intermediate;
    
    //invert R3 based on OP code
    assign R3_intermediate = R3 ^ (ALUOp == 3'b011);
    
    //syntax of functions below is similar to that of FA_str
    and and_gate (and_out, R2,R3); //and case
    or or_gate (or_out, R2,R3); //or case
    not not_gate1 (not_R2, R2); //not case

    // using same adder to add and subtract
    FA_str adder (
        .c_out(c_out),          
        .sum(add_sub_out),
        .a(R2),
        .b(R3_intermediate),
        .c_in(C_in)
    );

    always @(*) begin // 3-8 mux design
        case(ALUOp)
            3'b000: R1 = R2;   // mov case
            3'b001: R1 = not_R2;  // not case
            3'b010: R1 = add_sub_out; // add case
            3'b011: R1 = add_sub_out; // sub case
            3'b100: R1 = or_out; // or case
            3'b101: R1 = and_out;  // and case
            default: R1 = 1'b0; 
        endcase
    end

endmodule
