module top_module (input x, input y, output z);
    wire z1,z2,z3,z4;
    a w1(.a1(x),.a2(y),.a3(z1));
    a w2(.a1(x),.a2(y),.a3(z2));
    b w3(.b1(x),.b2(y),.b3(z3));
    b w4(.b1(x),.b2(y),.b3(z4));
    assign z=((z1|z3)^(z2&z4));
    

endmodule
module a(input a1,input a2, output a3);
    assign a3=(a1^a2)&a1;
    
endmodule
module b(input b1,input b2,output b3);
    assign b3=~(b1^b2);
endmodule