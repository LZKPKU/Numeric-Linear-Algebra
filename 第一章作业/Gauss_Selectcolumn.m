%  列主元Gauss消去法
%  数据读入

%  格式为
%  n 0 0……
%  系数矩阵 A（n by n）
%  b （n by 1）

% 
% data = load('data.txt')
% n = data(1,1)
% A = data(2:n+1,:)
% b = data(n+2,:)
%
load testdata
% load Chapter1_p3
% 列主元Gauss消去法
% tic;
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
b = P*b;
% 前代法
for j=1:n-1
    b(j) = b(j)/1;
    b(j+1:n) = b(j+1:n)-b(j)*A(j+1:n,j);
end
%回代法
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

