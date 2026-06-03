`timescale 1ns/1ns
module tb_register_file();
reg clk,rst,write_enable;
reg [3:0] write_address;
reg [7:0] write_data;
reg [3:0] read_address1,read_address2;
wire  [7:0]read_data1,read_data2;

rfile uut(clk,rst,write_enable,write_address,write_data,read_address1,read_address2,read_data1,read_data2);

always begin
#5 clk=~clk;
end

initial begin

$dumpfile("rcb.vcd");
$dumpvars(0,tb_register_file);

clk=0;
rst=1;
write_enable = 0;
write_address = 0;
write_data = 0;
read_address1 = 0;
read_address2 = 0;

$monitor($time,"clk=%b,rst=%b,write_enable=%b,write_address=%h,write_data=%h,read_address1=%h,read_address2=%h,read_data1=%h,read_data2=%h",clk,rst,write_enable,write_address,write_data,read_address1,read_address2,read_data1,read_data2);

#10
rst=0;

#5
write_enable=1;
#5
write_address=4'h5;
#5
write_data=8'h4;
#5
read_address1=4'h5;
read_address2=4'h2;
#5

$display("Time %d: Value inside internal Reg 5 is %h", $time, uut.reg_file[5]);

$finish;

end

endmodule




