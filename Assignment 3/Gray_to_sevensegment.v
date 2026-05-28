module Decoder(input g3,input g2,input g1,output a,output b,output c,output d,output e,output f,output g);
assign a=g2|(g3~^g1);
assign b=~g3|(g2~^g1);
assign c=g3|~g2|g1;
assign d=(g3&~g2&g1)|(g2&~g1)|(~g3&~g1);
assign e=(g2&~g1)|(~g3&g2)|(~g3&~g1);
assign f=(~g2&~g1)|(~g2&g3)|(g3&~g1);
assign g=(g3^g2)|(g2&~g1);
endmodule


