module pe(clk,rst,x,y,pe_op);
input clk,rst;
input [7:0]x,y;
output [15:0]pe_op;

wire [15:0]mul_op;
reg [15:0]acc;

radix_8_booth_sel_mul u0(x,y,mul_op); 

always@(posedge clk)
begin

if(rst)

  acc=16'b0;
  
else    
    
  acc=acc+mul_op;
      
end

assign pe_op=acc;
  
endmodule

