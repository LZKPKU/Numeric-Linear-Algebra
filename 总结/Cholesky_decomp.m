function [A] = Cholesky_decomp(A)
% Cholesky�ֽ⣬�����ǶԳƾ���A
% ����Ǿ����Cholesky�ֽ⣬A = LTL
[m,n] = size(A);
    if m~=n
        fprintf('�����������Ҫ��������')
        return;
    end
%     if ~isempty(A-A')
%        fprintf('�������Գ�')
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

