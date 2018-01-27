function [x] = lgs(N,eps,r,x0)
% 线Gauss-Seidel迭代法，即将每N-1个x视为一个整体
% 输入：问题规模N，常数eps，方程Ax=r的右边项r，初始解x0
% 输出：Ax=r的解 x
% 备注：理论分析表明，该方法并不需要用到整个的A，而只需要用到A的对角线子阵a
%       以及次对角线子阵(单位阵)，处于效率考虑，不需要传入A

% N2 for 1/(N^2)
N2 = 1/(N*N);
n = N - 1;
% 构建对角子阵 a
eyen = eye(n);
a = 2*eyen - diag(ones(n-1,1),1) - diag(ones(n-1,1),-1);
% 需要用到(2eps*I+a)的逆
inverse = (a+2*eps*eyen)\eyen;

r2 = zeros(N+1,N+1);
x2 = zeros(N+1,N+1);

% 将x与r展成二维形式，便于计算
for i = 2:N
    r2(2:N,i) = r(1+(i-2)*(N-1):(i-1)*(N-1));
    x2(2:N,i) = x0(1+(i-2)*(N-1):(i-1)*(N-1));
end
% 迭代多次，每次依然利用对称性，正反各迭代一次
for j = 1:3
    % 
    for i = 2:N
        x2(i,2:n+1) = (eps*(x2(i-1,2:n+1) + x2(i+1,2:n+1))...
                       + N2*r2(i,2:n+1))*inverse;
    end

    for i = N:2
        x2(i,2:n+1) = (eps*(x2(i-1,2:n+1) + x2(i+1,2:n+1))...
                       + N2*r2(i,2:n+1))*inverse;
    end
end

% 将得到的2维形式的解x2 还原为一维的 x
tmp = x2(2:N,2:N);

for i = 1:N-1
    x(1+(i-1)*(N-1):i*(N-1),1)=tmp(:,i);
end

end

