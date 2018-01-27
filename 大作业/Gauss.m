function [x] = Gauss(A,f)
% 高斯消去法
% 输入：系数矩阵A，常数向量f
% 输出：排列成2维的解x
% 注：1. 由于A为严格对角占优，实际上列主元无需特意选取
%     2. A为带状矩阵，高斯消去法只需在带宽里计算即可

% 获得问题规模
[m,n] = size(A);
N = n+1;

% LU分解
for k = 1 : n-1
    % 利用带宽性质，只算k+N即可
    % 为了防止越界，计算edge
    edge = min(k+N,n);
    
    A(k+1:edge,k) = A(k+1:edge,k)/A(k,k);
    A(k+1:edge,k+1:n) = A(k+1:edge,k+1:n) - A(k+1:edge,k) * A(k,k+1:n);
end

% 前代法
for j=1:n-1
    f(j) = f(j)/1;
    f(j+1:n) = f(j+1:n)-f(j)*A(j+1:n,j);
end
%回代法
for j=n:-1:2
    f(j) = f(j)/A(j,j);
    f(1:j-1) = f(1:j-1)-f(j)*A(1:j-1,j);
end
f(1) = f(1)/A(1,1);
% 返回解 x
x = f;
end

