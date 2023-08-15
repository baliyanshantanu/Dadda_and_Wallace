module tb_dadda;

reg [7:0] a ,b;
wire[15:0] result; 

integer i,j;


Dadda_mul DM( a,b,result) ;




initial 
begin



for ( i = 0 ; i<64; i=i+1 )
     for(j=0 ; j<64; j=j+1)
	      begin
			a= i ;
			b=j ;
			#5
			if(result == a*b)
			   begin
				$display("Pass the test\n"); 
				
				end
			else
			
			  begin
			  $display(" a= %d , b= %d Error result expected %d ,comming %d",a,b,a*b, result );
			  
			  
			  end
			  
			  #10 ;
			
			end
   
$finish ;
end






endmodule
