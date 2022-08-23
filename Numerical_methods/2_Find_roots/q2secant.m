f(x)=cos(x)+sin(x)-2*x^2;
epsilon=0.001;
x0=0.2;
x1=0.5;
epsilon=0.001;
for i=1:50
    y=double(x1-(f(x1)*(x1-x0)/(f(x1)-f(x0))));
    er=abs(y-x1);
    if er<epsilon
        break
    end
    x0=x1;
    x1=y;
end
fprintf("root= %f\n",x1);