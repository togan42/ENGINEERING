A= [ 9 1 1 1 ; 1 8 1 1 ; 1 1 7 1 ; 1 1 1 6]
r= [ 75 54 43 34 ]
s=0;
n=4;
for j=1:n-1 
    if A(j,j)==0    
        k=j;
        for k=k+1:n
            if A(k,j)==0
                continue 
            end
            break
        end
        B=A(j,:); C=r(j); 
        A(j,:)=A(k,:); r(j)=r(k);
        A(k,:)=B; r(k)=C;
    end
    for i=1+s:n-1
        L=A(i+1,j)/A(j,j);
        A(i+1,:)=A(i+1,:)-L*A(j,:);
        r(i+1)=r(i+1)-L*r(j);
    end
    s=s+1;
end 
x(n)=r(n)/A(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n 
        sum=sum+A(i,j)*x(j);
    end
    x(i)=(1/A(i,i))*(r(i)-sum);
end
disp('solution of linear equations:');
disp(x')