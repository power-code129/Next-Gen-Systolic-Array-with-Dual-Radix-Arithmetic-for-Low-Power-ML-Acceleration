module hcp_adder(x,y,op);
input [15:0]x,y;
output [15:0]op;

wire [15:0]s1,c1;
wire [14:1]c2;

halfadder u0(x[0],y[0],s1[0],c1[0]);
fulladder u1(x[1],y[1],c1[0],s1[1],c1[1]);

halfadder u2(x[2],y[2],s1[2],c1[2]);
fulladder u3(x[3],y[3],c1[2],s1[3],c1[3]);

halfadder u4(x[4],y[4],s1[4],c1[4]);
fulladder u5(x[5],y[5],c1[4],s1[5],c1[5]);

halfadder u6(x[6],y[6],s1[6],c1[6]);
fulladder u7(x[7],y[7],c1[6],s1[7],c1[7]);

halfadder u8(x[8],y[8],s1[8],c1[8]);
fulladder u9(x[9],y[9],c1[8],s1[9],c1[9]);

halfadder u10(x[10],y[10],s1[10],c1[10]);
fulladder u11(x[11],y[11],c1[10],s1[11],c1[11]);

halfadder u12(x[12],y[12],s1[12],c1[12]);
fulladder u13(x[13],y[13],c1[12],s1[13],c1[13]);

halfadder u14(x[14],y[14],s1[14],c1[14]);
fulladder u15(x[15],y[15],c1[14],s1[15],c1[15]);

assign op[0]=s1[0];
assign op[1]=s1[1];
halfadder u16(s1[2],c1[1],op[2],c2[1]);
halfadder u17(s1[3],c2[1],op[3],c2[2]);
fulladder u18(s1[4],c1[3],c2[2],op[4],c2[3]);
halfadder u19(s1[5],c2[3],op[5],c2[4]);

fulladder u20(s1[6],c1[5],c2[4],op[6],c2[5]);
halfadder u21(s1[7],c2[5],op[7],c2[6]);

fulladder u22(s1[8],c1[7],c2[6],op[8],c2[7]);
halfadder u23(s1[9],c2[7],op[9],c2[8]);

fulladder u24(s1[10],c1[9],c2[8],op[10],c2[9]);
halfadder u25(s1[11],c2[9],op[11],c2[10]);

fulladder u26(s1[12],c1[11],c2[10],op[12],c2[11]);
halfadder u27(s1[13],c2[11],op[13],c2[12]);

fulladder u28(s1[14],c1[13],c2[12],op[14],c2[13]);
halfadder u29(s1[15],c2[13],op[15],c2[14]);


endmodule