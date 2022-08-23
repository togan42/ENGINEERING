x=[2.00 4.25 5.25 7.81 9.20 10.60];
y=[7.2 7.1 6.0 5.0 3.5 5.0];
x_est=4;
scatter(x,y)
for k=1:3
sum=0;
for i=1:k % order 
  pr = 1;
  for j=1:k % order
    if j~=i
      pr=pr*(x_est-x(j))/(x(i)-x(j));
    end
  end
  sum=sum+y(i)*pr;
end
fprintf("order %d result at x=4 %f\n",k,sum);
end