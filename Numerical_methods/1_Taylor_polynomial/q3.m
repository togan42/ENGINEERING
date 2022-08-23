syms x
f =  x^5;
t1(x)=taylor(f,x,0.5,"Order",1);
t3(x)=taylor(f,x,0.5,"Order",3);
t5(x)=taylor(f,x,0.5,"Order",5);
t1(1)
t3(1)
t5(1)
fplot([t1 t3 t5 f])
legend("1st order","3rd order","5th order","function")