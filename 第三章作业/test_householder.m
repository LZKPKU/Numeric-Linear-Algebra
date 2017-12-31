%Householder变换

%test
x=[10,98,78,10]'


n = length(x)
%每一分量的最大值为1
x = x/norm(x,inf)
ssq = x(2:n)'*x(2:n)
v(2:n,1) = x(2:n,1)
if ssq==0
    beta=0
else
    alpha=sqrt(x(1)^2+ssq)
    if x(1)<=0
        v(1)=x(1)-alpha
    else
        v(1)=-ssq/(x(1)+alpha)
    end
    beta=2*v(1)^2/(ssq+v(1)^2)
    v = v/v(1)
end


H = eye(4,4)-beta*v*v'
H*x