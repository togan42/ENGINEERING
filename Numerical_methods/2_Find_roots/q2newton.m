f(x)=cos(x)+sin(x)-2*x^2;
fdif(x)=diff(f(x));
epsilon=0.001;
x0=0.2;
for i= 1:50
    y=double(x0-(f(x0)/fdif(x0)));
    er=abs(y-x0);
    if er<epsilon
        break
    end
x0=y;
end
fprintf("root= %f\n",y);