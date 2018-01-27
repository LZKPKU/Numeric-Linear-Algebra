function [error] = calc_err(f,N)
% ��������l2������
% �����ǽ�����f�������ģN
% ���Ϊ������error
% �ú�����Ҫ�����������ģ������ֵ����������2����ת��Ϊ��ҵҪ���l2������
% ������1/N.

hx = 1/N;
hy = 1/N;

for i = 1:N-1
    x(i) = i*hx;
end

for j = 1:N-1
    y(j) = j*hy;
end

% �õ���ֵ
for i = 1:N-1
    for j = 1:N-1
        gt((i-1)*(N-1)+j) = sin(pi*x(i))*sin(pi*y(j));
    end
end
gt = gt';
% ���������
error = hx * norm(f-gt);
end

