x1=[1930,1940,1945,1950,1955,1960,1965,1970,1980,1985,1990,1995,2000,2010,2015];
y=[59.6,61.3,59.1,62.4,76.0,69.7,73.1,81.2,78.6,76.4,82.0,82.4,83.0,84.3,86.0];
scatter(x1,y)
n=length(x1);
a = ((sum(x1)*sum(y))-(n*sum(x1.*y)))/(sum(x1)^2-(n*sum(x1.^2)));
b = (sum(x1)*sum(x1.*y)-sum(y)*sum(x1.^2))/(sum(x1)^2-n*sum(x1.^2));
syms x
z(x)=a*x+b;
hold on;
plot(x1,z(x1));
fprintf("Life expectancy at 2003 => %f",double(z(2003)))






