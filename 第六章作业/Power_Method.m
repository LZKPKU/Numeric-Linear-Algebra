function [y,mu] = power_method(A)
% �ݷ�
% �����Ǿ���A��n*n��
% �����ģ�������ֵmu������������y

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

