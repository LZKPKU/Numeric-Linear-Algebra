%Householder变换
function [v,beta] = house(x)
%输入为一个列向量x
%返回v与beta，其效果是计算出了一个x的Householder变换，可以将x变成
%（a,0,0,0,...,0）的形式。用于之后的QR分解
n = length(x);
%每一分量的最大值为1
x = x/norm(x,inf);
ssq = x(2:n)'*x(2:n);
v(2:n,1) = x(2:n,1);
if ssq==0
    beta=0;
else
    alpha=sqrt(x(1)^2+ssq);
    if x(1)<=0
        v(1)=x(1)-alpha;
    else
        v(1)=-ssq/(x(1)+alpha);
    end
    beta=2*v(1)^2/(ssq+v(1)^2);
    v = v/v(1);
end
end
