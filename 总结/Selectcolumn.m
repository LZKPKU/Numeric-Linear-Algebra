function [A,P] = Selectcolumn(A)
% 输入是一个方阵A
% 输出是置换矩阵P，以及相应的是A
[m,n] = size(A);
if m~=n
    fprintf('输入矩阵必须是方阵');
    return;
end
P=eye(n,n);
for k = 1:n-1
    m=k;M = abs(A(k,k));
    %选取最大列主元
    for p = k:n
        if abs(A(p,k))>M
            M = abs(A(p,k));
            m = p;
        end
    end
    %交换列主元
     A([k,m],:) = A([m,k],:);
     P([k,m],:) = P([m,k],:);
     if A(k,k)~=0
         A(k+1:n,k) = A(k+1:n,k)/A(k,k);
         A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
     else
         stop('矩阵奇异');
     end
end



end

