function [gt] = Data_gt(N,eps)
% ����������ʵ��gt�ĺ���
% ���룺����N��eps
% ����� ����gt((N-1)^2 by 1)

hx = 1/N;
hy = 1/N;
% �õ��е�������x
for i = 1:N-1
    x(i) = i*hx;
end
% �õ��е�����ڵ�y
for j = 1:N-1
    y(j) = j*hy;
end

% gt ��Ϊ ground truth�� ����������
for i = 1:N-1
    for j = 1:N-1
        gt((i-1)*(N-1)+j) = sin(pi*x(i))*sin(pi*y(j));
    end
end
gt = gt';
end