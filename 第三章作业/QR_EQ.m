function[result]=QR_EQ(n,A,b)
%利用QR分解求解方程的函数，n为矩阵A的阶数
%b为n by 1的列向量
%QR分解
for j=1:n
    if j<n
        %调用house函数,得到householder变换中的beta与v
        [v,beta] = house(A(j:n,j));
        %对相应的A的列施加householder变化
        A(j:n,j:n) = (eye(n-j+1,n-j+1)-beta*v*v')*A(j:n,j:n);
        %d中存放beta值，A的下三角部分存放对应的v，v(1)=1
        d(j)=beta;
        A(j+1:n,j)=v(2:n-j+1);
    end
end
%重建Q，Q为n by n 的矩阵
V = tril(A,-1)+eye(n,n);
Q=eye(n,n);
for j=1:n-1
    v=V(:,j);
    beta = d(j);
    Q=Q*(eye(n,n)-beta*v*v');
end
%Qy = b，Q为正交矩阵，可以直接算y = Qb.
result = Q'*b;

% 回代法，求解Rx = y,但在QR法里只能应用与前n-1行
for j=n-1:-1:2
    result(j) = result(j)/A(j,j);
    result(1:j-1) = result(1:j-1)-result(j)*A(1:j-1,j);
end
result(1) = result(1)/A(1,1);
%最后一行单独处理,因为其实质上并没有通过QR分解
result(n) = result(n)-A(n,1:n-1)*result(1:n-1)
end
