f(x)=((cos(x)+sin(x))/2)^0.5;
x0=0.2;
epsilon=0.001;
for i=1:50
    x1=double(f(x0));
    er=abs(x1-x0);
    if er<epsilon
        break
    end
    x0=x1;
end
fprintf("root= %f\n",x1);