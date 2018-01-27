function [x] = pgs(A,b,x0,itr)
% 点Gauss-Seidel迭代法，即为普通的GS迭代
% 输入：系数矩阵A，常数向量b，初始解x0，迭代次数itr
% 输出：Ax=b的解 x

% A的对角阵D
D = diag(diag(A));
%A的下三角部分的相反数L
L = -tril(A,-1);
%A的上三角部分的相反数U
U = -triu(A,1);

x = x0;

% 多次用到，提前算好
p = (D-L)\b;
q = (D-U)\b;

% 利用对称性，故每次循环中如此进行两次
for i = 1:itr
    x = (D-L)\(U*x) + p;
    x = (D-U)\(L*x) + q;
end

end

