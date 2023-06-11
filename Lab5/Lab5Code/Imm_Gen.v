/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

`timescale 1ns/1ps

module Imm_Gen(
	input  [31:0] instr_i,
	output reg [31:0] Imm_Gen_o
	);

/* Write your code HERE */
//Internal Signals
wire    [7-1:0] opcode;
wire    [2:0]   func3;
wire    [3-1:0] Instr_field;
assign opcode = instr_i[6:0];
assign funct3 = instr_i[14:12];
assign funct7 = instr_i[31:25];
assign opcode = instr_i[6:0];
assign func3  = instr_i[14:12];

always @(*) begin
    case(opcode)
        7'b0110011: begin //R-type
            Imm_Gen_o <= 32'b0;
        end
        7'b0010011: begin //addi
            Imm_Gen_o[10:0] <= instr_i[30:20];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:11] <= 21'b111111111111111111111;
            end
            else begin
                Imm_Gen_o[31:11] <= 21'b0;
            end
        end
        7'b0000011: begin //Load
            Imm_Gen_o[10:0] <= instr_i[30:20];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:11] <= 21'b111111111111111111111;
            end
            else begin
                Imm_Gen_o[31:11] <= 21'b0;
            end
        end
        7'b0100011: begin //Store
            Imm_Gen_o[0] <= instr_i[7];
            Imm_Gen_o[4:1] <= instr_i[11:8];
            Imm_Gen_o[10:5] <= instr_i[30:25];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:11] <= 21'b111111111111111111111;
            end
            else begin
                Imm_Gen_o[31:11] <= 21'b0;
            end
        end
        7'b1100011: begin //Branch
            Imm_Gen_o[0] <= 1'b0;
            Imm_Gen_o[4:1] <= instr_i[11:8];
            Imm_Gen_o[10:5] <= instr_i[30:25];
            Imm_Gen_o[11] <= instr_i[7];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:12] <= 20'b11111111111111111111;
            end
            else begin
                Imm_Gen_o[31:12] <= 20'b0;
            end
        end
        7'b1101111: begin //JAL
            Imm_Gen_o[0] <= 1'b0;
            Imm_Gen_o[10:1] <= instr_i[30:21];
            Imm_Gen_o[11] <= instr_i[20];
            Imm_Gen_o[19:12] <= instr_i[19:12];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:20] <= 12'b111111111111;
            end
            else begin
                Imm_Gen_o[31:20] <= 12'b0;
            end
        end
        7'b1100111: begin //JALR
            Imm_Gen_o[10:0] <= instr_i[30:20];
            if(instr_i[31]==1'b1) begin
                Imm_Gen_o[31:11] <= 21'b111111111111111111111;
            end
            else begin
                Imm_Gen_o[31:11] <= 21'b0;
            end
        end
        default: begin//other
            Imm_Gen_o <= 32'b0;
        end
    endcase
end

endmodule