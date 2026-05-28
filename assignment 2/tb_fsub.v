`timescale 1s/1s
module tb_fsub();
reg a, b, c;
wire bo,d;
fsub uut(a,b,c,bo,d);
initial begin
$dumpfile("fsub_sim.vcd");
$dumpvars(0,tb_fsub);

a=0;b=0;c=0;
#5
a=0;b=0;c=1;
#5
a=0;b=1;c=0;
#5
a=0;b=1;c=1;
#5
a=1;b=0;c=0;
#5
a=1;b=0;c=1;
#5
a=1;b=1;c=0;
#5
a=1;b=1;c=1;
#5
$finish;
end
endmodule
