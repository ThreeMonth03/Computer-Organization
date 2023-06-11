/***************************************************
Student Name: 張君實
Student ID: 0810749
***************************************************/
`timescale 1ns/1ps

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				Cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout       //1 bit carry out (output)
	);

/* Write your code HERE */
always@(*)
case ({Ainvert,Binvert,operation})
	4'b0000: 
		begin
			result <= src1 & src2;
			cout <= 1'b0;
		end
	4'b0001:
		begin
			result <= src1 | src2;
			cout <= 1'b0;
		end
	4'b0010:
		begin
			{cout,result} <= src1 + src2 + Cin;
		end
	4'b0110:
		begin
			cout <= (src1 & ~src2) | (src1 & Cin) | (~src2 & Cin);
			result <= src1 ^ ~src2 ^ Cin;
		end
	4'b0111:
		begin
			cout <= (src1 & ~src2) | (src1 & Cin) | (~src2 & Cin);
			result <= src1 ^ ~src2 ^ Cin;
		end
	4'b1100:
		begin
			result <= ~ src1 & ~src2 ;
			cout <= 1'b0;
		end
	4'b1101:
		begin
			result <= ~src1 | ~src2 ;
			cout <= 1'b0;
		end
	default:
			begin
				cout <= 1'b0; 
				result <= 1'b0;
			end
endcase
endmodule
