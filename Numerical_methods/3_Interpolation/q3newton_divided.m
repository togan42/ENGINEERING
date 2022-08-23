x1=[0,8,16,24,32,40];
y=[14.621,11.843,9.870,8.418,7.305,6.413];
n=length(x1);
b(1)=y(1);
b(2)=(y(2)-b(1))/(x1(2)-x1(1));
b(3)=(((y(3)-y(2))/(x1(3)-x1(2)))-b(2))/(x1(3)-x1(1));
syms x
for r=1:2
order=r;
f=0;
for i=1:(order+1) 
    g=1;
    for j=1:(i-1)
        g=g*(x-x1(j));
    end
    f=f+(g*b(i));
end
a(x)=f;
fprintf("order %d result for o(28)=%f\n",r,double(a(28)))
end