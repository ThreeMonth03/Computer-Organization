/***************************************************
Student Name: 林佑檍
Student ID: 0711099
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input	[4-1:0]	instr,
	input	[2-1:0]	ALUOp,
	output	reg [4-1:0] ALU_Ctrl_o
	);
	
/* Write your code HERE */
reg [4-1:0] ctrl;

always @(*) begin
	case (ALUOp)
		2'b00: begin	//S-type 
			ctrl = 4'b0010;	//add
		end
		2'b01: begin	//B-type
			ctrl = 4'b0110;	//sub
		end
		default: begin	//R-type
			case (instr[2:0])
				3'b000: begin	//add, sub
					ctrl = 4'b0010;
					ctrl[2] = (instr[3]==1 ? 1:0);	//from funct7 field
				end
				3'b111: begin	//AND
					ctrl = 4'b0000;
				end
				3'b110: begin	//OR
					ctrl = 4'b0001;
				end
				3'b100: begin	//xor
					ctrl = 4'b0111;
				end
				3'b010: begin	//set less than
					ctrl = 4'b1000;
				end
				3'b001: begin	//shift left
					ctrl = 4'b1100;
				end
				3'b101: begin	//shift right
					ctrl = 4'b1010;
				end
				default: begin
					ctrl = 4'b1111;
				end
			endcase
		end
	endcase
	ALU_Ctrl_o = ctrl;
end

endmodule