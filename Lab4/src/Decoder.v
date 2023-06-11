/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

   `timescale 1ns/1ps

   module Decoder(
       input   [7-1:0]     instr_i,
       output              RegWrite,
       output              Branch,
       output              Jump,
       output              WriteBack1,
       output              WriteBack0,
       output              MemRead,
       output              MemWrite,
       output              ALUSrcA,
       output              ALUSrcB,
       output  [2-1:0]     ALUOp
   );

   reg[11-1:0] decoder_o;
    always @(*) begin
        case(instr_i)
            7'b0110011: begin //R-type
                /*RegWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                WriteBack1 = 1'b0;
                WriteBack0 = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'bX;
                ALUSrcB = 1'b0;
                ALUOp = 2'b1X;*/
		decoder_o = 11'b1000000X01X;
            end
            7'b0010011: begin //addi
                /*RegWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                WriteBack1 = 1'b0;
                WriteBack0 = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'bX;
                ALUSrcB = 1'b1;
                ALUOp = 2'b00;*/
		decoder_o = 11'b1000000X100;
            end
            7'b0000011: begin //Load
                /*RegWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                WriteBack1 = 1'b0;
                WriteBack0 = 1'b1;
                MemRead = 1'b1;
                MemWrite = 1'b0;
                ALUSrcA = 1'bX;
                ALUSrcB = 1'b1;
                ALUOp = 2'b00;*/
		decoder_o = 11'b1000110X100;
            end
            7'b0100011: begin //Store
                /*RegWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                WriteBack1 = 1'bX;
                WriteBack0 = 1'bX;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                ALUSrcA = 1'bX;
                ALUSrcB = 1'b1;
                ALUOp = 2'b00;*/
		decoder_o = 11'b000XX01X100;
            end
            7'b1100011: begin //Branch
                /*RegWrite = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                WriteBack1 = 1'bX;
                WriteBack0 = 1'bX;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'b0;
                ALUSrcB = 1'b0;
                ALUOp = 2'b01;*/
		decoder_o = 11'b010XX000001;
            end
            7'b1101111: begin //JAL
                /*RegWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b1;
                WriteBack1 = 1'b1;
                WriteBack0 = 1'bX;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'b0;
                ALUSrcB = 1'bX;
                ALUOp = 2'bXX;*/
		decoder_o = 11'b1011X000XXX;
            end
            7'b1100111: begin //JALR
                /*RegWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b1;
                WriteBack1 = 1'b1;
                WriteBack0 = 1'bX;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'b1;
                ALUSrcB = 1'bX;
                ALUOp = 2'bXX;*/
		decoder_o = 11'b1011X001XXX;
            end
            default: begin//other
                /*RegWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                WriteBack1 = 1'b0;
                WriteBack0 = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUSrcA = 1'b0;
                ALUSrcB = 1'b0;
                ALUOp = 2'b00;*/
		decoder_o = 11'b00000000000;
            end
        endcase
    end

   assign RegWrite = decoder_o[10];
   assign Branch = decoder_o[9];
   assign Jump = decoder_o[8];
   assign WriteBack1 = decoder_o[7];
   assign WriteBack0 = decoder_o[6];
   assign MemRead = decoder_o[5];
   assign MemWrite = decoder_o[4];
   assign ALUSrcA = decoder_o[3];
   assign ALUSrcB = decoder_o[2];
   assign ALUOp = decoder_o[1:0];
   endmodule

