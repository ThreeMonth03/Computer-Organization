/***************************************************
Student Name:張君實
Student ID:0810749
***************************************************/
`timescale 1ns/1ps

module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
wire [31:0]c;
wire [31:0]temp_result;

ALU_1bit	alu1_bit0(	src1[0],src2[0],ALU_control[3],ALU_control[2],ALU_control[2],ALU_control[1:0],temp_result[0],c[0]);
ALU_1bit	alu1_bit1(	src1[1],src2[1],ALU_control[3],ALU_control[2],c[0],ALU_control[1:0],temp_result[1],c[1]);
ALU_1bit	alu1_bit2(	src1[2],src2[2],ALU_control[3],ALU_control[2],c[1],ALU_control[1:0],temp_result[2],c[2]);
ALU_1bit	alu1_bit3(	src1[3],src2[3],ALU_control[3],ALU_control[2],c[2],ALU_control[1:0],temp_result[3],c[3]);
ALU_1bit	alu1_bit4(	src1[4],src2[4],ALU_control[3],ALU_control[2],c[3],ALU_control[1:0],temp_result[4],c[4]);
ALU_1bit	alu1_bit5(	src1[5],src2[5],ALU_control[3],ALU_control[2],c[4],ALU_control[1:0],temp_result[5],c[5]);
ALU_1bit	alu1_bit6(	src1[6],src2[6],ALU_control[3],ALU_control[2],c[5],ALU_control[1:0],temp_result[6],c[6]);
ALU_1bit	alu1_bit7(	src1[7],src2[7],ALU_control[3],ALU_control[2],c[6],ALU_control[1:0],temp_result[7],c[7]);
ALU_1bit	alu1_bit8(	src1[8],src2[8],ALU_control[3],ALU_control[2],c[7],ALU_control[1:0],temp_result[8],c[8]);
ALU_1bit	alu1_bit9(	src1[9],src2[9],ALU_control[3],ALU_control[2],c[8],ALU_control[1:0],temp_result[9],c[9]);
ALU_1bit	alu1_bit10(	src1[10],src2[10],ALU_control[3],ALU_control[2],c[9],ALU_control[1:0],temp_result[10],c[10]);
ALU_1bit	alu1_bit11(	src1[11],src2[11],ALU_control[3],ALU_control[2],c[10],ALU_control[1:0],temp_result[11],c[11]);
ALU_1bit	alu1_bit12(	src1[12],src2[12],ALU_control[3],ALU_control[2],c[11],ALU_control[1:0],temp_result[12],c[12]);
ALU_1bit	alu1_bit13(	src1[13],src2[13],ALU_control[3],ALU_control[2],c[12],ALU_control[1:0],temp_result[13],c[13]);
ALU_1bit	alu1_bit14(	src1[14],src2[14],ALU_control[3],ALU_control[2],c[13],ALU_control[1:0],temp_result[14],c[14]);
ALU_1bit	alu1_bit15(	src1[15],src2[15],ALU_control[3],ALU_control[2],c[14],ALU_control[1:0],temp_result[15],c[15]);
ALU_1bit	alu1_bit16(	src1[16],src2[16],ALU_control[3],ALU_control[2],c[15],ALU_control[1:0],temp_result[16],c[16]);
ALU_1bit	alu1_bit17(	src1[17],src2[17],ALU_control[3],ALU_control[2],c[16],ALU_control[1:0],temp_result[17],c[17]);
ALU_1bit	alu1_bit18(	src1[18],src2[18],ALU_control[3],ALU_control[2],c[17],ALU_control[1:0],temp_result[18],c[18]);
ALU_1bit	alu1_bit19(	src1[19],src2[19],ALU_control[3],ALU_control[2],c[18],ALU_control[1:0],temp_result[19],c[19]);
ALU_1bit	alu1_bit20(	src1[20],src2[20],ALU_control[3],ALU_control[2],c[19],ALU_control[1:0],temp_result[20],c[20]);
ALU_1bit	alu1_bit21(	src1[21],src2[21],ALU_control[3],ALU_control[2],c[20],ALU_control[1:0],temp_result[21],c[21]);
ALU_1bit	alu1_bit22(	src1[22],src2[22],ALU_control[3],ALU_control[2],c[21],ALU_control[1:0],temp_result[22],c[22]);
ALU_1bit	alu1_bit23(	src1[23],src2[23],ALU_control[3],ALU_control[2],c[22],ALU_control[1:0],temp_result[23],c[23]);
ALU_1bit	alu1_bit24(	src1[24],src2[24],ALU_control[3],ALU_control[2],c[23],ALU_control[1:0],temp_result[24],c[24]);
ALU_1bit	alu1_bit25(	src1[25],src2[25],ALU_control[3],ALU_control[2],c[24],ALU_control[1:0],temp_result[25],c[25]);
ALU_1bit	alu1_bit26(	src1[26],src2[26],ALU_control[3],ALU_control[2],c[25],ALU_control[1:0],temp_result[26],c[26]);
ALU_1bit	alu1_bit27(	src1[27],src2[27],ALU_control[3],ALU_control[2],c[26],ALU_control[1:0],temp_result[27],c[27]);
ALU_1bit	alu1_bit28(	src1[28],src2[28],ALU_control[3],ALU_control[2],c[27],ALU_control[1:0],temp_result[28],c[28]);
ALU_1bit	alu1_bit29(	src1[29],src2[29],ALU_control[3],ALU_control[2],c[28],ALU_control[1:0],temp_result[29],c[29]);
ALU_1bit	alu1_bit30(	src1[30],src2[30],ALU_control[3],ALU_control[2],c[29],ALU_control[1:0],temp_result[30],c[30]);
ALU_1bit	alu1_bit31(	src1[31],src2[31],ALU_control[3],ALU_control[2],c[30],ALU_control[1:0],temp_result[31],c[31]);

always@(*)begin
	if(rst_n)begin
		if (ALU_control[3:0]==4'b0111) begin
			if(temp_result[31]==1'b1)
				result = 32'b00000000000000000000000000000001;
			else
				result = 32'b00000000000000000000000000000000;
			if(|result == 1'b0)
				zero = 1'b1;
			else
				zero = 1'b0;
			overflow = 1'b0;
			cout = 1'b0;
		end
		else begin
			if(|temp_result == 1'b0)
				zero <= 1'b1;
			else
				zero <= 1'b0;
			cout <= c[31];
			overflow <= c[30] ^ c[31];
			result <= temp_result;
		end
	end
	else begin
		zero <= 1'b0;
		cout <= 1'b0;
		overflow <= 1'b0;
		result = 32'b00000000000000000000000000000000;
	end
end

endmodule
