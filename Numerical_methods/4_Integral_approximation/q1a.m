syms x
fa(x)=sin(pi*x);
f(x)=1+(diff(fa(x)))^2;
N=5;
for y=1:3
h=10/N;
It=0;
a=0;
for k=1:(N-1)
    a=k*h;
    It=It+f(a);
end
It=h*(f(0)+f(10))/2+h*It;
fprintf('Trapezoidal rule for n=%d  I=%f\n\n',N,double(It));
It=0;
a=0;
for k=1:(N-1)
    a=k*h;
    if(mod(a,h*2)==0)
        It=It+2*f(a);
    end
     if(mod(a,h*2)==h)
        It=It+4*f(a);   
     end
end
It=h*(f(0)+f(10))/3+h*It/3;
fprintf('Simpson’s 1/3 rule for n=%d I=%f\n\n',N,double(It));
N=N*2; % N=5,10,20
end