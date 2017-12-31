function [H] = Hessenberg(A)
% ��Hessenberg��
% ���룺����A
% ���������H
[m,n] = size(A);

for k = 1 : n-2
    [v,beta] = house(A(k+1:n,k));
    temp = eye(n-k)-beta*v*v';
    A(k+1:n,k:n) = temp*A(k+1:n,k:n);
    A(1:n,k+1:n) = A(1:n,k+1:n)*temp; 
end
H = A;
end

