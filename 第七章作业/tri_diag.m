function [H] = tri_diag(A)
% �������ԽǷֽ⣺Householder�任��
% ���룺ʵ�Գƾ���A
% ��������ԽǾ���H
n = length(A);
for k=1:n-2
[v,beta] = house(A(k+1:n,k));
u = beta*(A(k+1:n,k+1:n)*v);
w = u-(beta*(u'*v)/2)*v;
A(k+1,k) = norm(A(k+1:n,k),2);
A(k,k+1) = A(k+1,k);
A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-v*w'-w*v';
end
H = A;

end

