module fadd(input a,input b,input cin, output cout,output sum);
     assign cout=a&b|(a^b)&cin;
     assign sum=a^b^cin;
    
endmodule
module Radd(input [3:0]a,input [3:0]b,input cin, output cout,output [3:0]sum);
      wire cout1,cout2,cout3;
      fadd f1(a[0],b[0],cin,cout1,sum[0]);
      fadd f1(a[1],b[1],cout1,cout2,sum[1]);
      fadd f1(a[2],b[2],cout2,cout3,sum[2]);
      fadd f1(a[3],b[3],cout3,cout,sum[3]);
endmodule