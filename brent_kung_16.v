module brent_kung_16(A,B,result,carry_in);
input[15:0] A,B;
input carry_in;
output[16:0] result;
//output carry;

wire[15:0] p0;
wire[15:0] g0;
wire[7:0] p1;
wire[7:0] g1;
wire[3:0] p2;
wire[3:0] g2;
wire[1:0] p3;
wire[1:0] g3;
wire p4;
wire g4;

wire[15:1] c;
wire c1,c2,c3;


imp_xor h_xor(.a(A[0]),.b(B[0]),.y(p0[0]));          //p0(0) generated
imp_and t1_and(.a(A[0]),.b(B[0]),.y(c1));
imp_or t1_or(.a(A[0]),.b(B[0]),.y(c2));
imp_and t2_and(.a(carry_in),.b(c2),.y(c3));            //g0(0) generated
imp_or t3_or(.a(c1),.b(c3),.y(g0[0]));


genvar i;
generate
for (i=1 ;i<16 ;i=i+1) begin : block_1
  imp_xor i_xor(.a(A[i]),.b(B[i]),.y(p0[i]));
  imp_and i_and(.a(A[i]),.b(B[i]),.y(g0[i]));
end
endgenerate



genvar j;
generate
for (j=0; j<8; j=j+1) begin : block_2
  imp_and j_and(.a(p0[2*j+1]),.b(p0[2*j]),.y(p1[j]));
  func j_func(.a(g0[2*j+1]),.b(p0[2*j+1]),.c(g0[2*j]),.y(g1[j]));
end
endgenerate



genvar k;
generate
for (k=0; k<4; k=k+1) begin: block_3
  imp_and k_and(.a(p1[2*k+1]),.b(p1[2*k]),.y(p2[k]));
  func k_func(.a(g1[2*k+1]),.b(p1[2*k+1]),.c(g1[2*k]),.y(g2[k]));
end
endgenerate



genvar l;
generate
for (l=0; l<2; l=l+1) begin : block_4
  imp_and l_and(.a(p2[2*l+1]),.b(p2[2*l]),.y(p3[l]));
  func l_func(.a(g2[2*l+1]),.b(p2[2*l+1]),.c(g2[2*l]),.y(g3[l]));
end
endgenerate

imp_and m_and(.a(p3[1]),.b(p3[0]),.y(p4));
func m_func(.a(g3[1]),.b(p3[1]),.c(g3[0]),.y(g4));

//Carry generation
// final carry

assign result[16] = g4;
assign c[8] = g3[0];
assign c[4] = g2[0];
assign c[2] = g1[0];
assign c[1] = g0[0];

/// c(6),c(10),c(12),c(14)


func n_func(.a(g1[2]),.b(p1[2]),.c(c[4]),.y(c[6]));
func o_func(.a(g1[4]),.b(p1[4]),.c(c[8]),.y(c[10]));
func p_func(.a(g2[2]),.b(p2[2]),.c(c[8]),.y(c[12]));
func q_func(.a(g1[6]),.b(p1[6]),.c(c[12]),.y(c[14]));

//// c(3) , c(5) ,...c(15)
genvar r;
generate
for (r=3; r<16; r=r+2) begin : block_5
  func l_func(.a(g0[r-1]),.b(p0[r-1]),.c(c[r-1]),.y(c[r]));
  end
endgenerate  
  
  

imp_xor res_0(.a(p0[0]),.b(carry_in),.y(result[0]));
  
genvar s;
generate
for (s=1; s<16; s=s+1) begin:block_6
  imp_xor s_sum(.a(p0[s]),.b(c[s]),.y(result[s]));
  end
endgenerate  

endmodule