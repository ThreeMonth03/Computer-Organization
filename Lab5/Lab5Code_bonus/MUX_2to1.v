/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module MUX_2to1(
	input   	[32-1:0] data0_i,       
	input   	[32-1:0] data1_i,
	input       	     select_i,
	output wire [32-1:0] data_o
               );			   

reg[31:0] result;
assign data_o = result;

always @(*) begin
	case (select_i)
		1'b0: begin
			result = data0_i;
		end
		1'b1: begin
			result = data1_i;
		end
		default: begin
			result = 0;
		end
	endcase
end

endmodule      
          