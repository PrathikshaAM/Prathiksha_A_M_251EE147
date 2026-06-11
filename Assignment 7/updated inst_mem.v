module inst_mem(input [7:0] addr,output [15:0] inst_out);

reg [15:0] rom [0:255];

initial begin

   
   rom[8'd0]=16'h1105; //LDB 5 IN R1
   rom[8'd1]=16'h120A; //LDB 10 IN R2
   rom[8'd2]=16'hB012; //ADD R0,R1,R2
   rom[8'd3]=16'hC312; //SUB R3,R1,R2
   rom[8'd4]=16'hE420; //INC R4,R2
   rom[8'd5]=16'h8510; //NOT R5,R1,R2
   rom[8'd6]=16'h1655; //LDB R6,85
   rom[8'd7]=16'h0760; //MVR R6 TO R7
   rom[8'd8]=16'h2500; //STB
   rom[8'd9]=16'h3700; //RDS
   rom[8'd10]=16'h0000;
   
end

assign inst_out=rom[addr];

endmodule


