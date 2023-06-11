/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

    `timescale 1ns/1ps
    /*instr[30,14:12]*/
    module ALU_Ctrl(
        input       [4-1:0] instr,
        input       [2-1:0] ALUOp,
        output      [4-1:0] ALU_Ctrl_o
    );
    reg [4-1:0] Ctrl;
    wire [2:0] func3;
    assign func3 = instr[2:0];
    wire [5:0] ctrl;
	assign ctrl = {ALUOp, instr};
    always @(*) begin
        if(ctrl[5:4]==2'b00)begin
            case(ctrl[2:0])
                3'b000: begin //addi
                    Ctrl=4'b0010;
                end
                3'b010: begin //lw sw
                    Ctrl=4'b0010;
                end
                default: begin //default
                    Ctrl=4'b0000;
                end
            endcase
        end
        else if(ctrl[5:4]==2'b01)begin //beq
                    Ctrl=4'b0110;
        end
        else begin
            case(ctrl[3:0])
                4'b0000:begin //add
                    Ctrl=4'b0010;
                end
                4'b1000:begin //sub
                    Ctrl=4'b0110;
                end
                4'b0111:begin //and
                    Ctrl=4'b0000;
                end
                4'b0110:begin //or
                    Ctrl=4'b0001;
                end
                4'b0010:begin //slt
                    Ctrl=4'b0111;
                end
                default: begin //default
                    Ctrl=4'b0000;
                end
            endcase
        end
    end
    assign ALU_Ctrl_o = Ctrl;
    endmodule

