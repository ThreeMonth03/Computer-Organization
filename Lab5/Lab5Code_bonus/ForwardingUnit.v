/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

module ForwardingUnit (EXE_instr19_15, EXE_instr24_20, MEM_instr11_7, MEM_WBControl, WB_instr11_7, WB_Control, src1_sel_o, src2_sel_o);

	input [5-1:0] EXE_instr19_15,	//RS1
	              EXE_instr24_20,	//RS2 
		      MEM_instr11_7,	//MEM_RD
		      WB_instr11_7;	//WB_RD
	input MEM_WBControl,
	      WB_Control;
	output wire [2-1:0] src1_sel_o, 
			    src2_sel_o;
	
reg [2-1:0] SLT1;
reg [2-1:0] SLT2;
assign src1_sel_o = SLT1;
assign src2_sel_o = SLT2;

always @(*) begin
	if(MEM_WBControl == 1'b1 && (MEM_instr11_7!=0) && EXE_instr19_15 == MEM_instr11_7) begin
		SLT1 <= 2'b10;
	end
	else if(WB_Control == 1'b1 && (WB_instr11_7!=0) && EXE_instr19_15 == WB_instr11_7 && (!(MEM_WBControl == 1'b1 && (MEM_instr11_7!=0) && EXE_instr19_15 == MEM_instr11_7))) begin
		SLT1 <= 2'b01;
	end
	else begin
		SLT1 <= 2'b00;
	end

	if(MEM_WBControl == 1'b1 && (MEM_instr11_7!=0) && EXE_instr24_20 == MEM_instr11_7) begin
		SLT2 <= 2'b10;
	end
	else if(WB_Control == 1'b1 && (WB_instr11_7!=0) && EXE_instr24_20 == WB_instr11_7 && (!(MEM_WBControl == 1'b1 && (MEM_instr11_7!=0) && EXE_instr24_20 == MEM_instr11_7))) begin
		SLT2 <= 2'b01;
	end
	else begin
		SLT2 <= 2'b00;
	end
end

endmodule
 
