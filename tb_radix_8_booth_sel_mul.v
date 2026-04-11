module tb_radix_8_booth_sel_mul();
reg [7:0]x,y;
wire [15:0]op;

always
begin

#100 x=93;y=-56;
#100 x=29;y=-86;
#100 x=-121;y=79;

end

radix_8_booth_sel_mul u0(x,y,op);

endmodule