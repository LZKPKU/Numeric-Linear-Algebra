function [A,P] = Selectcolumn(A)
% ������һ������A
% ������û�����P���Լ���Ӧ����A
[m,n] = size(A);
if m~=n
    fprintf('�����������Ƿ���');
    return;
end
P=eye(n,n);
for k = 1:n-1
    m=k;M = abs(A(k,k));
    %ѡȡ�������Ԫ
    for p = k:n
        if abs(A(p,k))>M
            M = abs(A(p,k));
            m = p;
        end
    end
    %��������Ԫ
     A([k,m],:) = A([m,k],:);
     P([k,m],:) = P([m,k],:);
     if A(k,k)~=0
         A(k+1:n,k) = A(k+1:n,k)/A(k,k);
         A(k+1:n,k+1:n)=A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
     else
         stop('��������');
     end
end



end

