%  ����ԪGauss��ȥ��
%  ���ݶ���

%  ��ʽΪ
%  n 0 0����
%  ϵ������ A��n by n��
%  b ��n by 1��

% 
% data = load('data.txt')
% n = data(1,1)
% A = data(2:n+1,:)
% b = data(n+2,:)
%
load testdata
% load Chapter1_p3
% ����ԪGauss��ȥ��
% tic;
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
b = P*b;
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
% save Chapter1_p3_Gauss_selectcolumn res duration;

