function [H] = tri_diag(A)
% 计算三对角分解：Householder变换法
% 输入：实对称矩阵A
% 输出：三对角矩阵H
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

