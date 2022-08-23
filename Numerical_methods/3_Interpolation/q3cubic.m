x=[0,8,16,24,32,40];
y=[14.621,11.843,9.870,8.418,7.305,6.413];
b=0:1:40;
a=spline(x,y,b);
fprintf("result for o(28)=%f",a(28));
%cubic spline gives best estimation.