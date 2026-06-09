`timescale 1ns/1ns
module tb_inst_mem();
reg [7:0] addr;
wire [15:0] inst_out;

inst_mem uut(
    .addr(addr),
    .inst_out(inst_out)
);


initial begin

$monitor($time , "addr=%b,inst_out=%b",addr,inst_out);

$dumpfile("tim.vcd");
$dumpvars(0,tb_inst_mem);

addr=8'd0;
#10

addr=8'd1;
#10

addr=8'd2;
#10

addr=8'd3;
#10

addr=8'd4;
#10

addr=8'd5;
#10

addr=8'd6;
#10

addr=8'd7;
#10

$finish;

end

endmodule