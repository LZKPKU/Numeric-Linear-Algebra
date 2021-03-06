function [x,k] = Gauss_Seidel(A,b,tol,Max_itnum)
% Gauss-Seidel迭代法
% 输入是系数矩阵A，向量b，容忍度 tol，最大迭代次数Max_itnum.
% 输出是解x和迭代次数k

D = diag(diag(A));%A的对角部分D
L = -tril(A,-1);%A的下三角部分的相反数L
U = -triu(A,1);%A的上三角部分的相反数U
inver = (D-L)^(-1);
G = inver*U;
g = inver*b;
x0 = zeros(length(A),1);
x = G*x0+g;
k=1;
while norm(x-x0,2)>=tol
    x0 = x;
    x = G*x0+g;
    k = k+1;
    if k>= Max_itnum
        break;
    end
end
end

