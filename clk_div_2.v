module clk_div_2 ( clk ,rst,clk_out);
output reg clk_out;
input clk ;
input rst;
always @(posedge clk or posedge rst)
begin
if (rst)
     clk_out <= 1'b0;
else
     clk_out <= ~clk_out;	
end
endmodule
