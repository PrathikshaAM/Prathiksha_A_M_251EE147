module fsub(input a, input b,input c,output bo,output d);
assign bo=(~a&(b|c))+b&c;
assign d=a^b^c;
endmodule
