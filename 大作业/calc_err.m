function [error] = calc_err(f,N)
% 计算解的误差（l2范数）
% 输入是解向量f和问题规模N
% 输出为相对误差error
% 该函数主要是利用问题规模计算真值，并且向量2范数转换为作业要求的l2范数，
% 即除以1/N.

hx = 1/N;
hy = 1/N;

for i = 1:N-1
    x(i) = i*hx;
end

for j = 1:N-1
    y(j) = j*hy;
end

% 得到真值
for i = 1:N-1
    for j = 1:N-1
        gt((i-1)*(N-1)+j) = sin(pi*x(i))*sin(pi*y(j));
    end
end
gt = gt';
% 计算解的误差
error = hx * norm(f-gt);
end

