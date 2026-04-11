module tb_pe();
reg clk,rst;
reg [7:0]x,y;
wire [15:0]pe_op;


initial
begin
   clk=1'b1;rst=1'b1;x=10;y=5;
   forever #50 clk=~clk;
end


always
begin
   #1000 x=3;y=3;
end


pe u0(clk,rst,x,y,pe_op);


endmodule