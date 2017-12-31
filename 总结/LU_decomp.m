function [A] = LU_decomp(A)
% Gauss消去法，输入是矩阵
% 返回是矩阵的的LU分解
% 严格上三角是U，严格下三角是L
    [m,n] = size(A);
    if m~=n
        stop('矩阵的行数需要等于列数');
    end
    for k = 1:n-1
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
    end
end