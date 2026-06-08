`timescale 1ns/1ns
`include "defines.v"
module tb_cunit();

reg [3:0] opcode, r1, r2, r3;
wire [3:0] a_r2,a_r3,result;
wire write_enable;
wire [2:0] a_op;
wire [1:0] sel;
wire mem_enable;
wire flag_en;

control_unit uut(.opcode(opcode),.r1(r1),.r2(r2),.r3(r3),.a_r2(a_r2),.a_r3(a_r3),.result(result),.write_enable(write_enable),.a_op(a_op),.sel(sel),.mem_enable(mem_enable),.flag_en(flag_en));

initial begin

  opcode = 4'b0000;
    r1 = 4'b0000;
    r2 = 4'b0000;
    r3 = 4'b0000;

  $monitor($time, "opcode=%b,r1=%b,r2=%b,r3=%b,a_r2=%b,a_r3=%b,result=%b,write_enable=%b,a_op=%b,sel=%b,mem_enable=%b,flag_en=%b",opcode,r1,r2,r3,a_r2,a_r3,result,write_enable,a_op,sel,mem_enable,flag_en);

  $dumpfile("cunit.vcd");
  $dumpvars(0,tb_cunit);

  opcode=`NOT;
  r1=4'b000; r2=4'b0010;
  #10

  opcode=`AND;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`OR;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`ADD;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`SUB;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`XOR;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`INC;
  r1=4'b000; r2=4'b0010;r3=4'b0011;
  #10

  opcode=`MVR;
  r1=4'b000; r2=4'b0010;
  #10

  opcode=`LDB;
  r1=4'b000; 
  #10

  opcode=`STB;
  r1=4'b000; r2=4'b0010;
  #10

  opcode=`RDS;
  r1=4'b000;
  #10

  $finish;

end

endmodule