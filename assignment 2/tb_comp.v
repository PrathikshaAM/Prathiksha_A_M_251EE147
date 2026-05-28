`timescale 1s/1s
module tb_comp();
reg [3:0]a,b;
wire g,l,e;
comp_4bit uut(a[3:0],b[3:0],g,l,e);
initial begin
$monitor("Time=%0dt A=%b B=%b | G=%b L=%b E=%b", $time, a, b, g, l, e);
$dumpfile("comp.vcd");
$dumpvars(0,tb_comp);
a=4'b1000;b=4'b1001;
#10
a=4'b1100;b=4'b1110;
#10
a=4'b0110;b=4'b1000;
#10
a=4'b0001;b=4'b0010;
#10
a=4'b1111;b=4'b1111;
#10
$finish;
end
endmodule
