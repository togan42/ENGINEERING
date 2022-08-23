for a= 1:2
if a==1
f(x)=x^4-5*x+3;
else
f(x)=exp(x)-2*x-2;
end
x1=1;
x2=2;
    for i= 1:30
        xh=double((x1*f(x2)-x2*f(x1))/(f(x2)-f(x1)));
        if f(x1)*f(xh)<0 
            x2=xh;
        else
            x1=xh;
        end
    end  
fprintf("function%d %f\n",a,x1);
end