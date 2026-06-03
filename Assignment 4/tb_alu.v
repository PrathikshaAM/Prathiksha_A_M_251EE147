`timescale 1ns/1ns
module tb_alu();
reg [7:0] in1,in2;
reg [2:0]alu_op;
wire [7:0] result;
wire carry_flag;

alu uut(in1,in2,alu_op,result,carry_flag);

initial begin
 
 $dumpfile("alu.vcd");
 $dumpvars(0,tb_alu);

 $monitor($time,"in1=%h,in2=%h,alu_op=%b,result=%h,carry_flag=%b",in1,in2,alu_op,result,carry_flag);

 in1=8'b0;in2=8'b0;
#5

 alu_op=3'b000;
 in1=8'h7;
 #5

 alu_op=3'b001;
 in1=8'h7;in2=8'h7;
 #58

 alu_op=3'b010;
 in1=8'h7;in2=7'h7;
 #5

 alu_op=3'b011;
 in1=8'd125;in2=8'd200;
 #5

 alu_op=3'b100;
 in1=8'h7;in2=8'h8;
 #5

 alu_op=3'b101;
 in1=8'h4;in2=8'h3;
 #5

 alu_op=3'b110;
 in1=8'h15;
 #5

 $finish;

end

endmodule




 