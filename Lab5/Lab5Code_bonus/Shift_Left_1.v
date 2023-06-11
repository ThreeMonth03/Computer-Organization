/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module Shift_Left_1(
    input  		[32-1:0] data_i,
    output wire [32-1:0] data_o
    );

reg[31:0] result;
assign data_o = result;

always @(*) begin
	result = data_i << 1;	
end

endmodule