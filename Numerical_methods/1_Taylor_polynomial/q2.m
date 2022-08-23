syms x
f(x)=sin(x);
t(x)=taylor(f,x,0,"Order",5);
t(0.5)
t(1.94)
t(2)
fplot([f t])
legend("sin(x)","5th order taylor")