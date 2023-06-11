/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/
   `timescale 1ns/1ps

   module alu(
       input                   rst_n,         // negative reset            (input)
       input signed [32-1:0]   src1,          // 32 bits source 1          (input)
       input signed [32-1:0]   src2,          // 32 bits source 2          (input)
       input        [ 4-1:0]   ALU_control,   // 4 bits ALU control input  (input)
       output reg   [32-1:0]   result,        // 32 bits result            (output)
       output                  Zero          // 1 bit when the output is 0, zero must be set (output)
   );

   /* Write your code HERE */
       always@(*)begin
           if(rst_n) begin
                case(ALU_control)
                    4'b0000: begin // and
                        result <= src1 & src2;
                    end
                    4'b0001: begin // or
                        result <= src1 | src2;
                    end
                    4'b0010: begin // add
                        result <= src1 + src2;
                    end
                    4'b0110: begin // sub
                        result <= src1 - src2;
                    end
                    4'b0111: begin // slt
                        result <= (src1<src2)? 32'b1 : 32'b0;
                    end
		    default: begin
			result <= 32'b0 ;
		    end
                endcase
           end
           else begin
               result <= 32'b0;
           end
       end
       assign Zero = !result;
   endmodule
