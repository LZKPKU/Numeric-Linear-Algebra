%����QR�ֽ⣺Householder����
%  ���ݶ���

%  ��ʽΪ
%  m n 0����
%  ϵ������ A��m by n,m > n��,���һ��Ϊb
%  b ��m by 1��

load Chapter3_p3
tic;
[m,n]=size(A)
result = QR_LS(m,n,A,b);
duration = toc;
save Chapter3_p3_QR result duration