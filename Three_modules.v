module top_module ( input clk, input d, output q );
    wire a,b;
    my_dff m1(clk,d,a);
    my_dff m2(clk,a,b);
    my_dff m3(clk,b,q);
    

endmodule