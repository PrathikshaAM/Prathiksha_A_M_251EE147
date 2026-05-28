`timescale 1s/1s
module tb_fadd;
reg at,bt,cit;
wire cot,sumt;
fadd uut(at,bt,cit,cot,sumt);
initial begin
$dumpfile("basics_sim.vcd");
$dumpvars(0,tb_fadd);
at=0;bt=0;cit=0;
#5
at=0;bt=0;cit=1;
#5
at=0;bt=1;cit=0;
#5
at=0;bt=1;cit=1;
#5
at=1;bt=0;cit=0;
#5
at=1;bt=0;cit=1;
#5
at=1;bt=1;cit=0;
#5
at=1;bt=1;cit=1;
#5
$finish;
end
endmodule
