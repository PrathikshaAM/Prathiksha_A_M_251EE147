module rfile(input clk,input rst,input write_enable,input [3:0] write_address,input [7:0] write_data,input [3:0] read_address1,input [3:0] read_address2,output [7:0] read_data1,output [7:0] read_data2);

reg [7:0] reg_file[0:15];
integer i;

always@(posedge clk or posedge rst) begin
if(rst) begin
for(i=0;i<16;i=i+1) begin
reg_file[i]<=8'h00;
end
end
else if(write_enable) begin
reg_file[write_address]<=write_data;
end
end

assign read_data1 = reg_file[read_address1];
assign read_data2 = reg_file[read_address2];

endmodule


