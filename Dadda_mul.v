module Dadda_mul (input[7:0] a , input[7:0] b , output [15:0] result);

// Partial Product calculation

wire partial_product[63:0] ;

wire sum[54:0],carry[54:0];


genvar g;
  

  generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g=g+1) begin : partial_product_row1
	      and_gate  a1( a[0] ,  b[g] ,  partial_product[g]) ;
      
    end
  endgenerate
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g=g+1) begin : partial_product_row2
	      and_gate   a2( a[1] ,  b[g] ,  partial_product[g+8]) ;
      
    end
  endgenerate
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row3
	      and_gate   a3( a[2] ,  b[g] ,  partial_product[g+16]) ;
      
    end
  endgenerate
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row4
	      and_gate   a4( a[3] ,  b[g] , partial_product[g+24]) ;
      
    end
  endgenerate
  
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row5
	      and_gate   a4( a[4] ,  b[g] , partial_product[g+32]) ;
      
    end
  endgenerate
  
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row6
	      and_gate   a4( a[5] ,  b[g] , partial_product[g+40]) ;
      
    end
  endgenerate
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row7
	      and_gate   a4( a[6] ,  b[g] , partial_product[g+48]) ;
      
    end
  endgenerate
  
  
  
  
    generate  // This will instantial full_adder SIZE-1 times
    for(g = 0; g<8; g= g+1) begin : partial_product_row8
	      and_gate   a4( a[7] ,  b[g] , partial_product[g+56]) ;
      
    end
  endgenerate
  
  
  
  
  



// Layer 1 with capacity = 6  calculation


HA ha1( partial_product[6], partial_product[13] , sum[0] ,  carry[0]) ;

FA fa1(partial_product[7], partial_product[14],partial_product[21], sum[1], carry[1]);
HA  ha2( partial_product[28], partial_product[35] , sum[2] ,  carry[2]) ;

FA fa2(partial_product[15], partial_product[22],partial_product[29], sum[3], carry[3]);
HA  ha3(partial_product[36], partial_product[43] , sum[4] ,  carry[4]) ;

FA fa3(partial_product[23], partial_product[30],partial_product[37], sum[5], carry[5]);


// Layer 2 with capacity = 4 calculation


HA ha4( partial_product[4] , partial_product[11],sum[6], carry[6]);


FA fa4( partial_product[5]  ,partial_product[12],partial_product[19] ,sum[7], carry[7]);
HA ha5( partial_product[26] , partial_product[33],sum[8], carry[8]);

FA fa5(sum[0],partial_product[20],partial_product[27], sum[9], carry[9]);
FA fa6(partial_product[34], partial_product[41], partial_product[48],sum[10], carry[10]);



FA fa7(carry[0],sum[1],sum[2], sum[11], carry[11]);
FA fa8(partial_product[42], partial_product[49], partial_product[56],sum[12], carry[12]);



FA fa9(carry[1],carry[2],sum[3], sum[13], carry[13]);
FA fa10(sum[4],partial_product[50],partial_product[57], sum[14], carry[14]);


FA fa11(carry[3],carry[4],sum[5], sum[15], carry[15]);
FA fa12(partial_product[44],partial_product[51],partial_product[58], sum[16], carry[16]);



FA fa13(carry[5],partial_product[31],partial_product[38], sum[17], carry[17]);
FA fa14(partial_product[45],partial_product[52],partial_product[59], sum[18], carry[18]);


FA fa15(partial_product[39],partial_product[46],partial_product[53], sum[19], carry[19]);







// Layer 3 with capacity = 3 calculation

HA ha6( partial_product[3] , partial_product[10],sum[20], carry[20]);
FA fa16(partial_product[18],partial_product[25],partial_product[32], sum[21], carry[21]);

FA fa17(carry[6],sum[7],sum[8], sum[22], carry[22]);
FA fa18(carry[7],carry[8],sum[9], sum[23], carry[23]);

FA fa19(carry[9],carry[10],sum[11], sum[24], carry[24]);

FA fa20(carry[11],carry[12],sum[13], sum[25], carry[25]);

FA fa21(carry[13],carry[14],sum[15], sum[26], carry[26]);

FA fa22(carry[15],carry[16],sum[17], sum[27], carry[27]);

FA fa23(carry[17],carry[18],sum[19], sum[28], carry[28]);

FA fa24(carry[19],partial_product[47],partial_product[54], sum[29], carry[29]);


// Layer 4  with capacity = 4 calculation


HA ha7( partial_product[2] , partial_product[9],sum[30], carry[30]);
FA fa25(sum[20],partial_product[17],partial_product[24], sum[31], carry[31]);


FA fa26(carry[20],sum[21],sum[6], sum[32], carry[32]);

FA fa27(carry[21],sum[22],partial_product[40], sum[33], carry[33]);

FA fa28(carry[22],sum[23],sum[10], sum[34], carry[34]);

FA fa29(carry[23],sum[24],sum[12], sum[35], carry[35]);

FA fa30(carry[24],sum[25],sum[14], sum[36], carry[36]);

FA fa31(carry[25],sum[26],sum[16], sum[37], carry[37]);

FA fa32(carry[26],sum[27],sum[18], sum[38], carry[38]);

FA fa311(carry[27],sum[28],partial_product[60], sum[39], carry[39]);
FA fa312(carry[28],sum[29],partial_product[61], sum[40], carry[40]);

FA fa33(carry[29],partial_product[55],partial_product[62], sum[41], carry[41]);





// for varification only --- modified later

//assign result[0] =  partial_product[0];

wire [15:0] A,B ;

assign A[0] = partial_product[0];
assign A[1] = partial_product[1];

   generate  
    for(g = 2; g<14; g= g+1) begin : A_operand
	      assign A[g] = sum[28+g] ;
      
    end
  endgenerate
  
  assign A[14] = partial_product[63] ;
  assign A[15] = 0 ;
  
  
  assign B[0] = 0 ;
  assign B[1] = partial_product[8]; 
  
  assign B[2] = partial_product[16] ;
  
  
  
   generate  
    for(g = 3; g<15; g= g+1) begin : B_operand
	      assign B[g] = carry[27+g] ;
      
    end
  endgenerate
  
  assign B[15] = 0 ;

  
  bk_16  result1(A,B,result,1'b0);
/*

HA  ha8(partial_product[1],partial_product[8], result[1], carry[42]);

FA  fa34(sum[30],partial_product[16],carry[42], result[2], carry[43]);


FA  fa35(sum[31],carry[30],carry[43], result[3], carry[44]);


FA  fa36(sum[32],carry[31],carry[44], result[4], carry[45]);


FA  fa37(sum[33],carry[32],carry[45], result[5], carry[46]);


FA  fa38(sum[34],carry[33],carry[46], result[6], carry[47]);


FA  fa39(sum[35],carry[34],carry[47], result[7], carry[48]);


FA  fa40(sum[36],carry[35],carry[48], result[8], carry[49]);

//

FA  fa41(sum[37],carry[36],carry[49], result[9], carry[50]);


FA  fa42(sum[38],carry[37],carry[50], result[10], carry[51]);


FA  fa43(sum[39],carry[38],carry[51], result[11], carry[52]);


FA  fa44(sum[40],carry[39],carry[52], result[12], carry[53]);


FA  fa45(sum[41],carry[40],carry[53], result[13], carry[54]);

//


FA  fa46(partial_product[63],carry[41],carry[54], result[14], result[15]);



*/


endmodule


module and_gate(input a , input b , output c);

assign c = a&b ;

endmodule 



module HA(input a , input b , output sum , output carry);

assign sum = a^b ;
assign carry = a&b ;




endmodule




module FA(input a , input b , input c ,output sum,  output carry);

assign sum = a^b^c ;

assign carry = a&b | b&c | c&a ;


endmodule 
 




