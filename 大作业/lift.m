function [out] = lift(N,Vx)
% 提升操作
% 输入：规模N，待提升向量Vx
% 输出：提升后得到的上一层网格的向量out


% 首先把Vx转换为2维矩阵v2，便于操作
v2 = zeros(N+1,N+1);
for i = 2:N
    v2(2:N,i) = Vx(1+(i-2)*(N-1):(i-1)*(N-1));
end

% 上一网格上某结点的值，由其周围3*3网格的点加权求和得到
% padding = 2， 故上一层网格规模是下一层的2倍。

% 加权策略为
% 原有点不动，与两个点相邻的新点直接平均
% 与四个点相邻的新点则是四个点的平均

newN = N * 2 + 1;
tmp = zeros(newN,newN);
tmp(1:2:newN,1:2:newN) = v2;
tmp(2:2:newN,2:2:newN) = (v2(1:N,1:N)+v2(1:N,2:N+1)+v2(2:N+1,1:N)+v2(2:N+1,2:N+1))./4;
tmp(1:2:newN,2:2:newN) = (v2(:,1:N)+v2(:,2:N+1))./2;
tmp(2:2:newN,1:2:newN) = (v2(1:N,:)+v2(2:N+1,:))./2;

% 得到新的规模
newN = newN - 1;

% 将新的2维矩阵还原回一维向量
tmp = tmp(2:newN,2:newN);

for i = 1:newN-1
    out(1+(i-1)*(newN-1):i*(newN-1),1) = tmp(:,i);
end

end

