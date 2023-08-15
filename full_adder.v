module full_adder(a,b,cin,sum,cout);

input a,b,cin;
output sum,cout;

wire t1,t2,t3;

imp_xor g1(.a(a),.b(b),.y(t1));
imp_xor g2(.a(t1),.b(cin),.y(sum));

imp_and g3(.a(a),.b(b),.y(t2));
imp_and g4(.a(t1),.b(cin),.y(t3));

imp_or g5(.a(t3),.b(t2),.y(cout));

endmodule
