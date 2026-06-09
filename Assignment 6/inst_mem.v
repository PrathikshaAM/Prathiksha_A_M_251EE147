module inst_mem(input [7:0] addr,output [15:0] inst_out);

reg [15:0] rom [0:255];

initial begin

   
   rom[8'd0]= 16'hB012; //ADD R0,R1,R2
   rom[8'd1]=16'hC345; //SUB R3,R4,R5
   rom[8'd2]=16'hD678; //XOR R6,R7,R8
   rom[8'd3]=16'hE9A0; //INC R9,R10
   rom[8'd4]=16'h0AB0; //MVR R10,R11
   rom[8'd5]=16'h1C55; //LDB R12,85
   rom[8'd6]=16'h2350; //STB
   rom[8'd7]=16'h3D00; //RDS
   
end

assign inst_out=rom[addr];

endmodule


