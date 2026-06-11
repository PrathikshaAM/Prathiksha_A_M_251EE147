module mini_cpu(input clk,input rst,output reg [7:0] out);


  //---------PROGRAM_COUNTER---------------

   wire [7:0] addr;
   PC p1(.clk(clk),.rst(rst),.addr(addr));

  //---------INSTRUCTION_MEMORY------------

   wire [15:0] inst_out;
   inst_mem i1(.addr(addr),.inst_out(inst_out));

  //---------CONTROL_UNIT------------------

   wire [3:0] opcode,r1,r2,r3;
   wire [3:0] a_r2,a_r3,result;
   wire write_enable,flag_en,mem_enable;
   wire [2:0] a_op;
   wire [1:0] sel;

   assign opcode=inst_out[15:12];
   assign r1=inst_out[11:8];
   assign r2=inst_out[7:4];
   assign r3=inst_out[3:0];
   control_unit c1(.opcode(opcode),.r1(r1),.r2(r2),.r3(r3),.a_r2(a_r2),.a_r3(a_r3),.result(result),.write_enable(write_enable),.flag_en(flag_en),.mem_enable(mem_enable),.a_op(a_op),.sel(sel));

  //---------REGISTER_FILE--------------------
    
    wire [7:0] in1,in2;
    wire [7:0] write_data;
    rfile reg1(.clk(clk),.rst(rst),.write_enable(write_enable),.write_address(r1),.write_data(write_data),.read_address1(a_r2),.read_address2(a_r3),.read_data1(in1),.read_data2(in2));

  //-----------------ALU-----------------------
     
    wire [7:0] alu_out;
    wire carry_flag;
    alu a1(.in1(in1),.in2(in2),.alu_op(a_op),.result(alu_out),.carry_flag(carry_flag));
    

  //------DEFINING WRITE_DATA,IN_DATA,ETC--------------
   assign write_data=(sel==2'b01)? alu_out:(sel==2'b00)? in1:(sel==2'b10)? in_data: {7'b0000000,carry_flag};
   wire [7:0] in_data;
   assign in_data=inst_out[7:0];
    

   always@(posedge clk or posedge rst) begin
     if(rst)
      out<=8'b00000000;
    else if(mem_enable)
      out<=in1;
    end

endmodule
   
   
