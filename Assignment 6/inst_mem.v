module inst_mem(input [7:0] addr,output reg [15:0] inst_out);
always@(*) begin
   case(addr) 
   8'd0: inst_out=16'hB012; //ADD R0,R1,R2
   8'd1: inst_out=16'hC345; //SUB R3,R4,R5
   8'd2: inst_out=16'hD678; //XOR R6,R7,R8
   8'd3: inst_out=16'hE9A0; //INC R9,R10
   8'd4: inst_out=16'h0AB0; //MVR R10,R11
   8'd5: inst_out=16'h1C55; //LDB R12,85
   8'd6: inst_out=16'h2350; //STB
   8'd7: inst_out=16'h3D00; //RDS
   default: inst_out=16'h0000; 
   endcase
end

endmodule

