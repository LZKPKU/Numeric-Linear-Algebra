function [A] = Choleskyplus(A)
% �Ľ���ƽ������
% �����ǶԳƾ���
% ����ǸĽ���Cholesky�ֽ�LTDL
[m,n]=size(A)
     if m~=n
        fprintf('�����������Ҫ��������')
        return;
    end
%     if ~isempty(A-A')
%         fprintf('�������Գ�')
%         return;        
%     end    
v(1:n,1)=0;
% Cholesky�ֽ�
for j=1:n
    for i=1:j-1
        v(i)=A(j,i)*A(i,i);
    end
    A(j,j) = A(j,j)-A(j,1:j-1)*v(1:j-1);
    A(j+1:n,j)=(A(j+1:n,j)-A(j+1:n,1:j-1)*v(1:j-1))/A(j,j);
end
A = (diag(diag(A))*(tril(A,-1)'+eye(size(A))))+tril(A,-1);


end

