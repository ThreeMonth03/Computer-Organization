/***************************************************
Student Name:林佑檍_張君實
Student ID: group10_0711099_0810749
***************************************************/

   `timescale 1ns/1ps

   module Instr_Memory(
       input       [32-1:0]     addr_i,
       output wire [32-1:0]     instr_o
   );

   integer          i;
   reg     [32-1:0] instruction_file   [0:64];

   initial begin
       for ( i=0; i<32; i=i+1 )
           instruction_file[i] = 32'b0;
       $readmemb("Instruction.txt", instruction_file);
   end

   assign  instr_o = instruction_file[addr_i/4];

   endmodule
