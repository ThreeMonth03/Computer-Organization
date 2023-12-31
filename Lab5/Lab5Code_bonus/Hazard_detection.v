/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

module Hazard_detection(
input [4:0] IFID_regRs,
input [4:0] IFID_regRt,
input [4:0] IDEXE_regRd,
input IDEXE_memRead,
output reg PC_write,
output reg IFID_write,
output reg control_output_select
);

always@(*)begin
    if((IDEXE_memRead == 1'b1) && ((IDEXE_regRd == IFID_regRs)||(IDEXE_regRd == IFID_regRt)))begin
        PC_write <= 1'b0;
        IFID_write <= 1'b0;
        control_output_select <= 1'b0;
    end

    else begin
        PC_write <= 1'b1;
        IFID_write <= 1'b1;
        control_output_select <= 1'b1;
    end
end

endmodule

