/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module MUX_3to1(
	input   	[32-1:0] data0_i,       
	input   	[32-1:0] data1_i,
	input   	[32-1:0] data2_i,
	input       [ 2-1:0] select_i,
	output wire [32-1:0] data_o
               );			   

reg[31:0] result;
assign data_o = result;

always @(*) begin
	case (select_i)
		2'b00: begin
			result = data0_i;
		end
		2'b01: begin
			result = data1_i;
		end
		2'b10: begin
			result = data2_i;
		end
		default: begin
			result = 0;
		end
	endcase
end

endmodule      
          