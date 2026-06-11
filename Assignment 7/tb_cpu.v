`timescale 1ns/1ns
module tb_cpu();
reg clk,rst;
wire [7:0] out;

mini_cpu uut(.clk(clk),.rst(rst),.out(out));

always begin
#5 
clk=~clk;
end

initial begin
 
 $dumpfile("CPU.vcd");
 $dumpvars(0,tb_cpu);

 $display("\n==========================================================================");
 $display("   Time   | Reset | PC |  R0  |  R1  |  R2  |  R5  |  R6  |  R7  |   CPU Output");

 $monitor("%8tps |  %b  |  %2d  |  %h  |  %h   |  %h  |  %h   |  %h   |  %h   |    %d ",
           $time,rst,uut.p1.addr,
           uut.reg1.reg_file[0],
           uut.reg1.reg_file[1],
           uut.reg1.reg_file[2],
           uut.reg1.reg_file[5],
           uut.reg1.reg_file[6],
           uut.reg1.reg_file[7],
           out);

 clk=1'b0;
 rst=1'b1;

 #20

 rst=1'b0;

 #100

 $finish;
 end

endmodule


