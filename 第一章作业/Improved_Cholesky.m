% Cholesky�ֽ�:�Ľ���ƽ������
%  ���ݶ���

%  ��ʽΪ
%  n 0 0����
%  ϵ������ A��n by n��
%  b ��n by 1��
% 
% data = load('data_cholesky.txt')
% n = data(1,1)
% A = data(2:n+1,:)
% b = data(n+2,:)
% 

%  ���ݶ���
% load Chapter1_p2;
% tic;
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

% ǰ����
for j=1:n-1
    b(j) = b(j)/1;
    b(j+1:n) = b(j+1:n)-b(j)*A(j+1:n,j);
end
%�ش���
for j=n:-1:2
    b(j) = b(j)/A(j,j);
    b(1:j-1) = b(1:j-1)-b(j)*A(1:j-1,j);
end
b(1) = b(1)/A(1,1);
% print answer x
b
% duration= toc;
% res = b;
% save Chapter1_p2_Improved_Cholesky res duration;