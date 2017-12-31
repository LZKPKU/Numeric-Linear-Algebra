% Cholesky分解:平方根法


%  格式为
%  n 0 0……
%  系数矩阵 A（n by n）
%  b （n by 1）


% data = load('data_cholesky.txt')
% n = data(1,1)
% A = data(2:n+1,:)
% b = data(n+2,:)'

%  数据读入
% load Chapter1_p3;
% tic;
% Cholesky分解
for k=1:n
    A(k,k)=sqrt(A(k,k));
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=k+1:n
        A(j:n,j)=A(j:n,j)-A(j:n,k)*A(j,k);
    end
end
A = tril(A,-1)'+tril(A);

% 前代法
for j=1:n-1
    b(j) = b(j)/A(j,j);
    b(j+1:n) = b(j+1:n)-b(j)*A(j+1:n,j);
end
b(n) = b(n)/A(n,n);
%回代法
for j=n:-1:2
    b(j) = b(j)/A(j,j);
    b(1:j-1) = b(1:j-1)-b(j)*A(1:j-1,j);
end
b(1) = b(1)/A(1,1);
% print answer x
b
% duration= toc;
% res = b;
% save Chapter1_p3_Cholesky res duration;



