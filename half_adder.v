module half_adder(a,b,sum,cout);

input a,b;
output sum,cout;


imp_xor g1(.a(a),.b(b),.y(sum));

imp_and g2(.a(a),.b(b),.y(cout));



endmodule
