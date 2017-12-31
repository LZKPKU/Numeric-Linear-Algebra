%计算QR分解：Householder方法
%  数据读入

%  格式为
%  m n 0……
%  系数矩阵 A（m by n,m > n）,最后一列为b
%  b （m by 1）

load Chapter3_p3
tic;
[m,n]=size(A)
result = QR_LS(m,n,A,b);
duration = toc;
save Chapter3_p3_QR result duration