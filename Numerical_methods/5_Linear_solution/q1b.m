x1o=0;x2o=0;x3o=0;x4o=0;
eps=0.0001;hata=0.1;n=0;Nmax=100;
while(hata>0.0001)
  x1s=(-x2o-x3o-x4o+75)/9;
    x2s=(-x1s-x3o-x4o+54)/8;
    x3s=(-x1s-x2s-x4o+43)/7;
    x4s=(-x1s-x2s-x3s+34)/6;
     hata=max(abs([x1s-x1o x2s-x2o x3s-x3o x4s-x4o]));
    n=n+1;
    x1o=x1s;x2o=x2s;x3o=x3s;x4o=x4s;
end
disp('solution:');
x1s
x2s
x3s
x4s
fprintf('Number of iterations => %d',n);