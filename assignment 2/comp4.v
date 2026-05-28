module comp_1bit(
    input a, input b, 
    input pg, input pl, input pe, 
    output reg g, output reg l, output reg e);
always @(*) begin
if(pg) begin
g=1; l=0; e=0;
end
else if(pl) begin
g=0; l=1; e=0;
end
else begin
if (a>b) begin 
g=1; l=0; e=0;
end
else if (a<b) begin
g=0; l=1; e=0;
end
else begin
g=0; l=0; e=1;
end
end
end
endmodule

module comp_4bit(
    input [3:0] a, 
    input [3:0] b, 
    output g, output l, output e);
wire g3, l3, e3;
wire g2, l2, e2;
wire g1, l1, e1;
comp_1bit bit1(a[3], b[3], 1'b0, 1'b0, 1'b1, g3, l3, e3);
comp_1bit bit2(a[2], b[2], g3, l3, e3, g2, l2, e2);
comp_1bit bit3(a[1], b[1], g2, l2, e2, g1, l1, e1);
comp_1bit bit4(a[0], b[0], g1, l1, e1, g, l, e);
    
endmodule



