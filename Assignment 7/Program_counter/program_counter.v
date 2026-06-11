module PC(input clk,input rst,output reg [7:0] addr);
  
 
 
 always@(posedge clk or posedge rst) begin

      if(rst)
         addr<=0;
      else begin
         addr<=addr+1'b1;
        end
 end

endmodule


     