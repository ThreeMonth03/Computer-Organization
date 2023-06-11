/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module ALU_Ctrl(
	input		[4-1:0]	instr,
	input		[2-1:0]	ALUOp,
	output wire	[4-1:0] ALU_Ctrl_o
	);

reg[4-1:0] ctrl;
assign ALU_Ctrl_o = ctrl;

always @(*) begin
	case (ALUOp)
		2'b00: begin	//S-type & J-type & lw & jalr
			ctrl = 4'b0010;	//add
		end
		2'b01: begin	//B-type
			case (instr[2:0])
				3'b000: begin	//beq
					ctrl = 4'b0110;
				end
				3'b001: begin	//bne
					ctrl = 4'b0101;
				end
				3'b100: begin	//blt
					ctrl = 4'b0100;
				end
				3'b101: begin	//bgt
					ctrl = 4'b0011;
				end
				default: begin
					ctrl = 4'b1111;
				end
			endcase
		end
		default: begin	//R-type & I-type
			case (instr[2:0])
				3'b000: begin	//add, sub
					if(ALUOp==2'b10 && instr[3]==1) begin
						ctrl = 4'b0110;
					end
					else begin
						ctrl = 4'b0010;
					end
				end
				3'b111: begin	//and
					ctrl = 4'b0000;
				end
				3'b110: begin	//or
					ctrl = 4'b0001;
				end
				3'b001: begin	//shift left
					ctrl = 4'b1100;
				end
				3'b101: begin	//shift right
					if(ALUOp==2'b10 && instr[3]==1) begin
						ctrl = 4'b1010;
					end
					else if(ALUOp==2'b11) begin
						ctrl = 4'b1011;
					end
				end
				3'b010: begin	//set less than
					ctrl = 4'b1000;
				end
				3'b100: begin	//xor
					ctrl = 4'b0111;
				end
				default: begin
					ctrl = 4'b1111;
				end
			endcase
		end
	endcase
end


endmodule