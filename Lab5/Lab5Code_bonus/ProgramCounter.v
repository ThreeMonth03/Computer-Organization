/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module ProgramCounter(
    input				clk_i,
	input 				rst_i,
	input 				PCWrite,
	input	   [32-1:0] pc_i,
	output reg [32-1:0] pc_o
	);
 
//Main function
always @(posedge clk_i) begin
		if(~rst_i)
			pc_o <= 0;
		else if(PCWrite)
			pc_o <= pc_i;
		else if(~PCWrite)
			pc_o <= pc_i-4;
	end

endmodule



                    
                    