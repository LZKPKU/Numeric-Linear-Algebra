function [A] = Cholesky_decomp(A)
% Cholesky分解，输入是对称矩阵A
% 输出是矩阵的Cholesky分解，A = LTL
[m,n] = size(A);
    if m~=n
        fprintf('矩阵的行数需要等于列数')
        return;
    end
%     if ~isempty(A-A')
%        fprintf('矩阵必须对称')
%         return;        
%     end    
for k=1:n
    A(k,k)=sqrt(A(k,k));
    A(k+1:n,k)=A(k+1:n,k)/A(k,k);
    for j=k+1:n
        A(j:n,j)=A(j:n,j)-A(j:n,k)*A(j,k);
    end
end
A = tril(A,-1)'+tril(A);
end

