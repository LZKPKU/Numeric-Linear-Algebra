function [A] = Choleskyplus(A)
% 改进的平方根法
% 输入是对称矩阵
% 输出是改进的Cholesky分解LTDL
[m,n]=size(A)
     if m~=n
        fprintf('矩阵的行数需要等于列数')
        return;
    end
%     if ~isempty(A-A')
%         fprintf('矩阵必须对称')
%         return;        
%     end    
v(1:n,1)=0;
% Cholesky分解
for j=1:n
    for i=1:j-1
        v(i)=A(j,i)*A(i,i);
    end
    A(j,j) = A(j,j)-A(j,1:j-1)*v(1:j-1);
    A(j+1:n,j)=(A(j+1:n,j)-A(j+1:n,1:j-1)*v(1:j-1))/A(j,j);
end
A = (diag(diag(A))*(tril(A,-1)'+eye(size(A))))+tril(A,-1);


end

