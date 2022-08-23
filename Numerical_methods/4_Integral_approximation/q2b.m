syms x
f(x)=exp(-((x-69)^2)/5.6)/(2.8*sqrt(2*pi));
N=35;
h=65/N;
It=0;
for k=1:(N-1)
    a=k*h;
    if(mod(a,h*2)==h)
        It=It+4*f(a);
    end
     if(mod(a,h*2)==0)
        It=It+2*f(a);   
     end
end
It=h*(f(0)+f(65))/3+h*It/3; 
It=1-It;
fprintf('The probability that an American male is over 65 inches is => %f',double(It));
