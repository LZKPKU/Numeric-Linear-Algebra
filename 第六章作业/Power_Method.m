function [y,mu] = power_method(A)
% 幂法
% 输入是矩阵A（n*n）
% 输出是模最大特征值mu及其特征向量y

[m,n] = size(A);
Maxitr = 1000;
y = ones(n,1);
y = y/max(abs(y));
mu = 0;

for i = 1:Maxitr
    y = A*y;
    mu = max(abs(y));
    y = y/mu;
end    


end

