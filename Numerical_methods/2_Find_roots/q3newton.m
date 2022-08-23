f(x)=2*x^3-4*x^2-22*x+24;
fdif(x)=diff(f(x));
x0=-5;
for a=1:3
for i= 1:50
    y=double(x0-(f(x0)/fdif(x0)));
    er=abs(y-x0);
x0=y;
end
x0=x0+5;
fprintf("root%d= %f\n",a,y);
end
