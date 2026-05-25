module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
      wire cout,cout1,cout2;
    wire [15:0] sum0,ssum1;
      add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],cout);
    add16 a2(a[31:16],b[31:16],1'b0,sum0[15:0],cout1);
    add16 a3(a[31:16],b[31:16],1'b1,ssum1[15:0],cout2);
    assign sum[31:16]=(cout==1'b0)?sum0:ssum1;
endmodule