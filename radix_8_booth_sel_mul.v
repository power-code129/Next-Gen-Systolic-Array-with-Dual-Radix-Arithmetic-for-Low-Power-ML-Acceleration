module radix_8_booth_sel_mul(x,y,op);
input [7:0]x,y;
output [15:0]op;

reg [15:0]p1,p2,p3;

wire [4:0]c1,c2,c3; 
wire [15:0]y_v,y2_v,y3_v;
wire [15:0]sum,carry;

function [4:0] cont_line;
input [3:0] x;
reg s,d,t,q,n;
begin
    
    s=~(x[3]^x[2]) & (x[1]^x[0]);
    d=(x[1]^x[2]) & ~(x[1]^x[0]);
    t=(x[3]^x[2]) & (x[1]^x[0]);
    q=(x[3]^x[2]) & ~(x[1]^x[2]) & ~(x[1]^x[0]);
    n=x[3];
    
    cont_line={s,d,t,q,n};
    
end    
endfunction 

  
           
assign c1 = cont_line({x[2:0],1'b0});
assign c2 = cont_line(x[5:2]);
assign c3 = cont_line({x[7],x[7:5]});

assign   y_v  = {y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
assign   y2_v = {y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7:0],1'b0};

hcp_adder uh(y_v,y2_v,y3_v);
      
always@(y,c1,c2,c3,y3_v)
begin      
                
case(c1[4:1])
    4'b0000:p1=16'b0;
    4'b1000:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c1[0]==1'b0) 
                p1=y3_v;
            else
                p1=~y3_v + 1;                
            end            
    4'b0001:begin
            if(c1[0]==1'b0) 
                p1={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p1=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase


case(c2[4:1])
    4'b0000:p2=16'b0;
    4'b1000:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c2[0]==1'b0) 
                p2=y3_v;
            else 
                p2=~y3_v + 1;
            end            
    4'b0001:begin
            if(c2[0]==1'b0) 
                p2={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p2=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase



case(c3[4:1])
    4'b0000:p3=16'b0;
    4'b1000:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y[7],y} + 1;
            end    
    4'b0100:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,1'b0} + 1;
            end            
    4'b0010:begin
            if(c3[0]==1'b0) 
                p3=y3_v;
            else
                p3=~y3_v + 1;
            end            
    4'b0001:begin
            if(c3[0]==1'b0) 
                p3={y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0};
            else
                p3=~{y[7],y[7],y[7],y[7],y[7],y[7],y[7],y,2'b0} + 1;
            end            
endcase


end
 
fulladder u0(p1[0],1'b0,1'b0,sum[0],carry[0]);
fulladder u1(p1[1],1'b0,1'b0,sum[1],carry[1]);
fulladder u2(p1[2],1'b0,1'b0,sum[2],carry[2]);
fulladder u3(p1[3],p2[0],1'b0,sum[3],carry[3]);
fulladder u4(p1[4],p2[1],1'b0,sum[4],carry[4]);
fulladder u5(p1[5],p2[2],1'b0,sum[5],carry[5]);
fulladder u6(p1[6],p2[3],p3[0],sum[6],carry[6]);
fulladder u7(p1[7],p2[4],p3[1],sum[7],carry[7]);
fulladder u8(p1[8],p2[5],p3[2],sum[8],carry[8]);
fulladder u9(p1[9],p2[6],p3[3],sum[9],carry[9]);
fulladder u10(p1[10],p2[7],p3[4],sum[10],carry[10]);
fulladder u11(p1[11],p2[8],p3[5],sum[11],carry[11]);
fulladder u12(p1[12],p2[9],p3[6],sum[12],carry[12]);
fulladder u13(p1[13],p2[10],p3[7],sum[13],carry[13]);
fulladder u14(p1[14],p2[11],p3[8],sum[14],carry[14]);
fulladder u15(p1[15],p2[12],p3[9],sum[15],carry[15]);

assign op[0]=sum[0];
fulladder u16(sum[1],carry[0],1'b0,op[1],m1);
fulladder u17(sum[2],carry[1],m1,op[2],m2);
fulladder u18(sum[3],carry[2],m2,op[3],m3);
fulladder u19(sum[4],carry[3],m3,op[4],m4);
fulladder u20(sum[5],carry[4],m4,op[5],m5);
fulladder u21(sum[6],carry[5],m5,op[6],m6);
fulladder u22(sum[7],carry[6],m6,op[7],m7);
fulladder u23(sum[8],carry[7],m7,op[8],m8);
fulladder u24(sum[9],carry[8],m8,op[9],m9);
fulladder u25(sum[10],carry[9],m9,op[10],m10);
fulladder u26(sum[11],carry[10],m10,op[11],m11);
fulladder u27(sum[12],carry[11],m11,op[12],m12);
fulladder u28(sum[13],carry[12],m12,op[13],m13);
fulladder u29(sum[14],carry[13],m13,op[14],m14);
fulladder u30(sum[15],carry[14],m14,op[15],m15);


endmodule





