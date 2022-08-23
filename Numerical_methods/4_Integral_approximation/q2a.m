syms x
f(x)=exp(-((x-69)^2)/5.6)/(2.8*sqrt(2*pi));
N=2;
h=5/N;
for y=1:2
It=0;
for k=1:(N-1)
    a=k*h;
    It=It+f(a+65);
end
It=h*(f(65)+f(70))/2+h*It;
fprintf('Trapezoidal rule for n=%d  I=%f\n\n',N,double(It));
It=0;
for k=1:(N-1)
    a=k*h;
    if(mod(a,h*2)==h)
        It=It+4*f(a+65);
    end
     if(mod(a,h*2)==0)
        It=It+2*f(a+65);   
     end
end
It=h*(f(65)+f(70))/3+h*It/3;
fprintf('Simpson’s 1/3 rule for n=%d I=%f\n\n',N,double(It));
N=N+2;
end
It=0;
N=2;
for k=1:(N-1)
    a=k*h;
    It=It+3*f(a+65);
end
It=(h*3*(f(65)+f(70))/8)+(h*3*It/8);
fprintf('Simpson’s 3/8 rule for n=%d I=%f\n\n',N,double(It));