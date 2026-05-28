module fadd(input a,input b,input ci,output co,output sum);
assign co=(a&b)|ci&(a^b);
assign sum=a^b^ci;
endmodule