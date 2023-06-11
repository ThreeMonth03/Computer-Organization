/***************************************************
Student Name:林佑檍
Student ID:0711099
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input signed [32-1:0]	src1,          // 32 bits source 1          (input)
	input signed [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */

always @(*) begin
	if(~rst_n) begin	//reset
		result   <= 0;
		zero     <= 0;
		cout     <= 0;
		overflow <= 0;
	end
	else begin
		case (ALU_control)
			4'b0000: begin	//AND
				result = src1&src2;
			end
			4'b0001: begin	//OR
				result = src1|src2;
			end
			4'b0010: begin	//add
				result = src1+src2;
				if(src1[31]==src2[31] && src1[31]!=result[31]) begin
					overflow = 1;
				end
			end
			4'b0110: begin	//sub (beq)
				result = src1-src2;
				if(src1[31]==src2[31] && src1[31]!=result[31]) begin
					overflow = 1;
				end
			end
			4'b0111: begin	//xor
				result = src1^src2;
			end
			4'b1000: begin	//slt
				result = (src1<src2 ? 1:0);
			end
			4'b1010: begin	//shift right
				result = src1 >>> src2;
			end
			4'b1100: begin	//shift left
				result = src1 << src2;
			end
			default: begin
				result = 0;
			end
		endcase
		zero = !result;
	end
end



endmodule
