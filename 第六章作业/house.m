%Householder�任
function [v,beta] = house(x)
%����Ϊһ��������x
%����v��beta����Ч���Ǽ������һ��x��Householder�任�����Խ�x���
%��a,0,0,0,...,0������ʽ������֮���QR�ֽ�
n = length(x);
%ÿһ���������ֵΪ1
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
