/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/
module IF_register (clk_i, rst_i,IFID_write,address_i, instr_i,pc_add4_i, address_o, instr_o,flush,pc_add4_o);

	input clk_i ;
	input rst_i;
	input IFID_write;
	input [31:0] address_i;
	input [31:0] instr_i;
	input [31:0] pc_add4_i;
	input flush;
	output reg [31:0] address_o;
	output reg [31:0] instr_o;
	output reg [31:0] pc_add4_o;

always @(posedge clk_i) begin
	if(~rst_i) begin  //reset
		address_o <= 0;
		instr_o <= 0;
		pc_add4_o <= 0;
	end
	else if(flush)begin
		address_o <= 0;
		instr_o <= 0;
		pc_add4_o <= 0;
	end
	else if(IFID_write) begin
		address_o <= address_i;
		instr_o <= instr_i;
		pc_add4_o <= pc_add4_i;
	end
end

endmodule
