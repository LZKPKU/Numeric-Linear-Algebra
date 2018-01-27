function [f] = Data_f(N,eps)
% 构建方程右侧向量f的函数
% 输入：常数N和eps
% 输出： 向量f((N-1)^2 by 1)

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
% 由理论推导，f 可以直接由 gt *(1 + eps)*pi^2得到               
f = (1+eps)*pi^2*gt';   
end

