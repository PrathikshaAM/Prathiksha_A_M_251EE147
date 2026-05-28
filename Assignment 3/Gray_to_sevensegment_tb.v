`timescale 1s/1s
module tb_decode();
reg g3,g2,g1;
wire a,b,c,d,e,f,g;
Decoder uut(.g3(g3),.g2(g2),.g1(g1),.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g));
initial begin
$dumpfile("decode.vcd");
$dumpvars(0, tb_decode);
$monitor($time,"g3=%b,g2=%b,g1=%b,a=%b,b=%b,c=%b,d=%b,e=%b,f=%b,g=%b",g3,g2,g1,a,b,c,d,e,f,g);
g3=0;g2=0;g1=0;
#5
g3=0;g2=0;g1=1;
#5
g3=0;g2=1;g1=0;
#5
g3=0;g2=1;g1=1;
#5
g3=1;g2=0;g1=0;
#5
g3=1;g2=0;g1=1;
#5
g3=1;g2=1;g1=0;
#5
g3=1;g2=1;g1=1;
#5
$finish;
end
endmodule
