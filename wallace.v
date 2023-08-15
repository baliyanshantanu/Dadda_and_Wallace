module wallace(a,b,result);

input [7:0] a,b;
output [16:0]result;


wire[7:0] pp_row_1;
wire[8:1] pp_row_2;
wire[9:2] pp_row_3;
wire[10:3] pp_row_4;
wire[11:4] pp_row_5;
wire[12:5] pp_row_6;
wire[13:6] pp_row_7;
wire[14:7] pp_row_8;

genvar g;
  

  generate  // This will create partial products
    for(g = 0; g<8; g=g+1) begin : partial_product_row1
	      imp_and  row_1( .a(a[0]) ,  .b(b[g]) ,  .y(pp_row_1[g])) ;
			imp_and  row_2( .a(a[1]) ,  .b(b[g]) ,  .y(pp_row_2[g+1]));
			imp_and  row_3( .a(a[2]) ,  .b(b[g]) ,  .y(pp_row_3[g+2]));
			imp_and  row_4( .a(a[3]) ,  .b(b[g]) ,  .y(pp_row_4[g+3]));
			imp_and  row_5( .a(a[4]) ,  .b(b[g]) ,  .y(pp_row_5[g+4]));
			imp_and  row_6( .a(a[5]) ,  .b(b[g]) ,  .y(pp_row_6[g+5]));
			imp_and  row_7( .a(a[6]) ,  .b(b[g]) ,  .y(pp_row_7[g+6]));
			imp_and  row_8( .a(a[7]) ,  .b(b[g]) ,  .y(pp_row_8[g+7]));			
      
    end
  endgenerate


//{ Phase_1

// { Layer_1

wire[9:0] pp_row_9;
wire[9:2] pp_row_10;


assign pp_row_9[0]=pp_row_1[0];

half_adder l_1_h1(.a(pp_row_1[1]),.b(pp_row_2[1]),.sum(pp_row_9[1]),.cout(pp_row_10[2]));

genvar h;
  

  generate  // This will create partial products
    for(h = 2; h<=7; h=h+1) begin : phase_1_layer_1

	 full_adder phase_1_layer_1(.a(pp_row_1[h]),.b(pp_row_2[h]),.cin(pp_row_3[h]),.sum(pp_row_9[h]),.cout(pp_row_10[h+1]));
    
	 end
  endgenerate
  
half_adder l_1_h2(.a(pp_row_2[8]),.b(pp_row_3[8]),.sum(pp_row_9[8]),.cout(pp_row_10[9]));

assign pp_row_9[9]= pp_row_3[9];

// layer_1}

wire[12:3] pp_row_11;
wire[12:5] pp_row_12;


// {layer_2
 
 
assign pp_row_11[3]= pp_row_4[3]; 
 
half_adder p_1_l_2_h_1(.a(pp_row_4[4]),.b(pp_row_5[4]),.sum(pp_row_11[4]),.cout(pp_row_12[5]));
 
 
genvar i;
  

  generate  // This will create partial products
    for(i =5; i<=10; i=i+1) begin : phase_1_layer_2

	 full_adder phase_1_layer_2(.a(pp_row_4[i]),.b(pp_row_5[i]),.cin(pp_row_6[i]),.sum(pp_row_11[i]),.cout(pp_row_12[i+1]));
    
	 end
  endgenerate 

half_adder p_1_l_2_h_2(.a(pp_row_5[11]),.b(pp_row_6[11]),.sum(pp_row_11[11]),.cout(pp_row_12[12]));

assign pp_row_11[12] = pp_row_6[12];  

//layer 2}

wire[13:6] pp_row_13;
wire[14:7] pp_row_14;

assign pp_row_13[13:6] = pp_row_7[13:6];
assign pp_row_14[14:7] = pp_row_8[14:7];

/// phase_1}

/// {phase_2
wire[10:0] pp_row_15;
wire[12:3] pp_row_16;


//{ layer_1

assign pp_row_15[1:0] = pp_row_9[1:0];

half_adder p_2_l_1_h_1(.a(pp_row_9[2]),.b(pp_row_10[2]),.sum(pp_row_15[2]),.cout(pp_row_16[3]));


genvar j;
  

  generate  // This will create partial products
    for(j =3; j<=9; j=j+1) begin : phase_2_layer_1

	 full_adder phase_2_layer_1(.a(pp_row_9[j]),.b(pp_row_10[j]),.cin(pp_row_11[j]),.sum(pp_row_15[j]),.cout(pp_row_16[j+1]));
    
	 end
  endgenerate

  
assign pp_row_15[10] = pp_row_11[10];
assign pp_row_16[12:11] = pp_row_11[12:11];  


// layer_1 }

wire[14:5] pp_row_17;
wire[14:7] pp_row_18;


//{ layer_2

assign pp_row_17[5] = pp_row_12[5];

half_adder p_2_l_2_h_1(.a(pp_row_12[6]),.b(pp_row_13[6]),.sum(pp_row_17[6]),.cout(pp_row_18[7]));


genvar k;
  

  generate  // This will create partial products
    for(k =7; k<=12; k=k+1) begin : phase_2_layer_2

	 full_adder phase_2_layer_2(.a(pp_row_12[k]),.b(pp_row_13[k]),.cin(pp_row_14[k]),.sum(pp_row_17[k]),.cout(pp_row_18[k+1]));
    
	 end
  endgenerate
  
half_adder p_2_l_2_h_2(.a(pp_row_13[13]),.b(pp_row_14[13]),.sum(pp_row_17[13]),.cout(pp_row_18[14]));
  
assign pp_row_17[14] = pp_row_14[14];
 

// layer_2 }


/// phase_2}


///{ phase_3

wire[13:0] pp_row_19;
wire[14:4] pp_row_20;
wire[14:7] pp_row_21;

////{ layer_1

assign pp_row_19[2:0] = pp_row_15[2:0];

half_adder p_3_l_1_h_1(.a(pp_row_15[3]),.b(pp_row_16[3]),.sum(pp_row_19[3]),.cout(pp_row_20[4]));

half_adder p_3_l_1_h_2(.a(pp_row_15[4]),.b(pp_row_16[4]),.sum(pp_row_19[4]),.cout(pp_row_20[5]));

genvar l;
  

  generate  // This will create partial products
    for(l =5; l<=10; l=l+1) begin : phase_3_layer_1

	 full_adder phase_3_layer_1(.a(pp_row_15[l]),.b(pp_row_16[l]),.cin(pp_row_17[l]),.sum(pp_row_19[l]),.cout(pp_row_20[l+1]));
    
	 end
  endgenerate

half_adder p_3_l_1_h_3(.a(pp_row_16[11]),.b(pp_row_17[11]),.sum(pp_row_19[11]),.cout(pp_row_20[12]));

half_adder p_3_l_1_h_4(.a(pp_row_16[12]),.b(pp_row_17[12]),.sum(pp_row_19[12]),.cout(pp_row_20[13]));  


assign pp_row_19[13] = pp_row_17[13];

assign pp_row_20[14] = pp_row_17[14];
  
/// layer_1}


//{ layer_2

assign pp_row_21[14:7] = pp_row_18[14:7];

// layer_2 }

// phase_3 }


///{phase_4
wire[14:0] pp_row_22;
wire[15:5] pp_row_23;

assign pp_row_22[3:0] = pp_row_19[3:0];


half_adder p_4_l_1_h_1(.a(pp_row_19[4]),.b(pp_row_20[4]),.sum(pp_row_22[4]),.cout(pp_row_23[5]));

half_adder p_4_l_1_h_2(.a(pp_row_19[5]),.b(pp_row_20[5]),.sum(pp_row_22[5]),.cout(pp_row_23[6]));

half_adder p_4_l_1_h_3(.a(pp_row_19[6]),.b(pp_row_20[6]),.sum(pp_row_22[6]),.cout(pp_row_23[7]));


genvar m;
  

  generate  // This will create partial products
    for(m =7; m<=13; m=m+1) begin : phase_4_layer_1

	 full_adder phase_4_layer_1(.a(pp_row_19[m]),.b(pp_row_20[m]),.cin(pp_row_21[m]),.sum(pp_row_22[m]),.cout(pp_row_23[m+1]));
    
	 end
  endgenerate

  
half_adder p_4_l_1_h_4(.a(pp_row_20[14]),.b(pp_row_21[14]),.sum(pp_row_22[14]),.cout(pp_row_23[15]));  

/// phase_4}


//brent_kung_16 bk(.A({1'b0,pp_row_22[14:0]}),.B({pp_row_23[15:5],5'b0}),.result(result),.carry_in(1'b0));

assign result = {1'b0,pp_row_22[14:0]} + {pp_row_23[15:5],5'b0};

endmodule