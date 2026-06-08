module control_unit(input [3:0] opcode,input [3:0] r1,input [3:0] r2,input [3:0] r3,
output reg [3:0]  a_r2,output reg [3:0] a_r3,output reg [3:0] result,output reg write_enable,
output  reg [2:0] a_op,output reg [1:0] sel,output reg mem_enable,output reg flag_en);

`include "defines.v"


always@(*) begin 
  write_enable=1'b0;
  a_op=3'b000;mem_enable=1'b0;flag_en=1'b0;sel=2'b00;

  case(opcode)
       `NOT: begin a_r2=r2; result=r1; a_op=`A_NOT; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `AND: begin a_r2=r2; a_r3=r3; result=r1; a_op=`A_AND; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `OR: begin a_r2=r2; a_r3=r3; result=r1; a_op=`A_OR; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `ADD: begin a_r2=r2; a_r3=r3; result=r1;  a_op=`A_ADD; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `SUB: begin a_r2=r2; a_r3=r3; result=r1; a_op=`A_SUB; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `XOR: begin a_r2=r2; a_r3=r3; result=r1; a_op=`A_XOR; write_enable=1;sel=2'b01; flag_en=1'b1;end
       `INC: begin a_r2=r2; result=r1; a_op=`A_INC; write_enable=1;sel=2'b01; flag_en=1'b1;end

       `MVR: begin a_r2=r2; result=r1;write_enable=1; sel=2'b00; end
       `LDB: begin result=r1; write_enable=1; sel=2'b10; end
       `STB: begin a_r2=r2; result=r1;write_enable=0;mem_enable=1'b1;end
       `RDS: begin result=r1;sel=2'b11;write_enable=1'b1;end
   endcase
end

endmodule
