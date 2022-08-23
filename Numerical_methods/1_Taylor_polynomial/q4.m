syms x
f(x)=x^3+2*x^2-x+3;
h=0.1;
fw_dif(x)=(f(x+h)-f(x))/h ;
bw_dif(x)=(f(x)-f(x-h))/h ;
ct_dif(x)=(f(x+h)-f(x-h))/(2*h) ;
fw_dif(1)
bw_dif(1)
ct_dif(1)
fplot([fw_dif bw_dif ct_dif f])
legend("forwarddiff","backwarddiff","centraldiff","real function")
