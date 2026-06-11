`timescale 1ns/1ns
module tb_program_counter();

reg clk,rst;
wire [7:0] addr;

PC ttb(.clk(clk),.rst(rst),.addr(addr));

always begin
#5
clk=~clk;
end

initial begin 
  
  $dumpfile("pc.vcd");
  $dumpvars(0,tb_program_counter);
  clk=0;
  rst=1; 

  $monitor($time,"clk=%b,rst=%b,addr=%d",clk,rst,addr);

  #10
  rst=0;
  
  #100

  $finish;
end

endmodule