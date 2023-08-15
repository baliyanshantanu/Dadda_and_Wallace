module func(a,b,c,y);
input a,b,c;
output y;

wire y1;

imp_and inst_and(.a(b),.b(c),.y(y1));
imp_or inst_or(.a(a),.b(y1),.y(y));

endmodule