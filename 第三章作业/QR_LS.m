function[result]=QR_LS(m,n,A,b)
%求解最小二乘的函数，m与n分别为矩阵A的行数和列数
%b为n by 1的列向量

%要求m<n
if m<n 
    stop('矩阵的行数需要大于列数');
end
d(1:n,1)=0;
%QR分解
for j=1:n
    if j<m
        %调用house函数,得到householder变换中的beta与v
        [v,beta] = house(A(j:m,j));
        %对相应的A的列施加householder变化
        A(j:m,j:n) = (eye(m-j+1,m-j+1)-beta*v*v')*A(j:m,j:n);
        %d中存放beta值，A的下三角部分存放对应的v，v(1)=1
        d(j)=beta;
        A(j+1:m,j)=v(2:m-j+1);
    end
end
%重建Q，Q为m by m 的矩阵
V = tril(A,-1)+eye(m,n);
H=eye(m,m);
for j=1:n
    v=V(:,j);
    beta = d(j);
    H=H*(eye(m,m)-beta*v*v');
end
%只需要Q的前n列作用在b上得到c1
Q = H(:,1:n)';
result = Q*b;
%回代法，求解Rx = c1
for j=n:-1:2
    result(j) = result(j)/A(j,j);
    result(1:j-1) = result(1:j-1)-result(j)*A(1:j-1,j);
end
result(1) = result(1)/A(1,1);
end

