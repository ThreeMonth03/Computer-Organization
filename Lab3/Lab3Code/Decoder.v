/***************************************************
Student Name: 林佑檍
Student ID: 0711099
***************************************************/

`timescale 1ns/1ps

module Decoder(
	input [32-1:0] 	instr_i,
	output wire			ALUSrc,
	output wire			RegWrite,
	output wire			Branch,
	output wire [2-1:0]	ALUOp
	);
	
//Internal Signals
wire	[7-1:0]		opcode;
wire 	[3-1:0]		funct3;
reg	[3-1:0]		Instr_field;
reg	[9-1:0]		Ctrl_o;

assign opcode = instr_i[6:0];
assign funct3 = instr_i[14:12];

//R:0110011, B:1100011, S:0100011

always @(*) begin
	case (opcode)
		7'b1100011: begin	//B-type, not used in this lab
			Instr_field = 2'b11;
			Ctrl_o = 9'b000000101;
		end
		7'b0100011: begin	//S-type, not used in this lab
			Instr_field = 2'b10;
			Ctrl_o = 9'b010001000;
		end
		7'b0000011: begin	//lw, not used in this lab
			Instr_field = 2'b01;
			Ctrl_o = 9'b011110000;
		end
		7'b0110011: begin	//R-type
			Instr_field = 2'b00;
			Ctrl_o = 9'b000100010;
		end
		default: begin
			Instr_field = 2'b00;
			Ctrl_o = 9'b000000000;
		end
	endcase
end

assign ALUSrc 	= Ctrl_o[7];
assign RegWrite = Ctrl_o[5];
assign Branch	= Ctrl_o[2];
assign ALUOp 	= Ctrl_o[1:0];

endmodule





                    
                    