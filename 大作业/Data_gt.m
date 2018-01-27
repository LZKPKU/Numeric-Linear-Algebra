function [gt] = Data_gt(N,eps)
% 构建方程真实解gt的函数
% 输入：常数N和eps
% 输出： 向量gt((N-1)^2 by 1)

hx = 1/N;
hy = 1/N;
% 得到行的网格结点x
for i = 1:N-1
    x(i) = i*hx;
end
% 得到列的网格节点y
for j = 1:N-1
    y(j) = j*hy;
end

% gt 意为 ground truth， 即问题的真解
for i = 1:N-1
    for j = 1:N-1
        gt((i-1)*(N-1)+j) = sin(pi*x(i))*sin(pi*y(j));
    end
end
gt = gt';
end