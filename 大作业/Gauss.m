function [x] = Gauss(A,f)
% ��˹��ȥ��
% ���룺ϵ������A����������f
% ��������г�2ά�Ľ�x
% ע��1. ����AΪ�ϸ�Խ�ռ�ţ�ʵ��������Ԫ��������ѡȡ
%     2. AΪ��״���󣬸�˹��ȥ��ֻ���ڴ�������㼴��

% ��������ģ
[m,n] = size(A);
N = n+1;

% LU�ֽ�
for k = 1 : n-1
    % ���ô������ʣ�ֻ��k+N����
    % Ϊ�˷�ֹԽ�磬����edge
    edge = min(k+N,n);
    
    A(k+1:edge,k) = A(k+1:edge,k)/A(k,k);
    A(k+1:edge,k+1:n) = A(k+1:edge,k+1:n) - A(k+1:edge,k) * A(k,k+1:n);
end

% ǰ����
for j=1:n-1
    f(j) = f(j)/1;
    f(j+1:n) = f(j+1:n)-f(j)*A(j+1:n,j);
end
%�ش���
for j=n:-1:2
    f(j) = f(j)/A(j,j);
    f(1:j-1) = f(1:j-1)-f(j)*A(1:j-1,j);
end
f(1) = f(1)/A(1,1);
% ���ؽ� x
x = f;
end

