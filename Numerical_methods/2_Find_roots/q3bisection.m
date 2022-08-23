syms x;
f(x)=2*(x^3)-4*(x^2)-22*x+24;
x1=-5;
for a=1:3
x2=5;
    for i= 1:30
        xh=(x1+x2)/2;
        if f(x1)*f(xh)<=0 
            x2=xh;
        else
            x1=xh;
        end 
    end
fprintf("root%d= %f\n",a,x1);
x1=x1+1;
end
fplot([f])