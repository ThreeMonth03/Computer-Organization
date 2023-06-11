/***************************************************
Student Name: 林佑檍
Student ID: 0711099
***************************************************/

`timescale 1ns/1ps

module Adder(
    input  [32-1:0] src1_i,
	input  [32-1:0] src2_i,
	output [32-1:0] sum_o
	);
    
/* Write your code HERE */

reg[31:0] result;
assign sum_o = result;

always @(*) begin
	result = src1_i + src2_i;
end

endmodule