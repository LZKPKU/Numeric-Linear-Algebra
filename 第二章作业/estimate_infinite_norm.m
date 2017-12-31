%估计Ax = b的kappa-inf.
%估计矩阵A的逆的无穷范数(A的逆的转置的1范数)
%  格式为
%  n 0 0……
%  系数矩阵 A（n by n）
%  b （n by 1）

data = load('data_estimate_infinite_norm.txt');
n = data(1,1);
A = data(2:n+1,:);
b = data(n+1,:);
AT = A';

%对A做列主元Gauss消去法，得到LU，储存在A中，置换矩阵储存在P中
P=eye(n,n);
for k = 1:n-1
    m=k,M = abs(A(k,k));
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

%对AT做列主元Gauss消去法，得到LU，储存在AT中，置换矩阵储存在PT中
PT=eye(n,n);
for k = 1:n-1
    m=k,M = abs(AT(k,k));
    %选取最大列主元
    for p = k:n
        if abs(AT(p,k))>M
            M = abs(AT(p,k));
            m = p;
        end
    end
    %交换列主元
     AT([k,m],:) = AT([m,k],:);
     PT([k,m],:) = PT([m,k],:);
     if AT(k,k)~=0
         AT(k+1:n,k) = AT(k+1:n,k)/AT(k,k);
         AT(k+1:n,k+1:n)=AT(k+1:n,k+1:n)-AT(k+1:n,k)*AT(k,k+1:n);
     else
         stop('矩阵奇异');
     end
end


%  数据读入
%load data_estimate_infinite_norm
% 估计矩阵的无穷大范数
x(1:n,1) = 1/n;
falg = 1;
while flag==1
    %计算w
    w = x;
    w = PT*w;
    % 前代法
    for j=1:n-1
        w(j) = w(j)/1;
        for k=j+1:n
            w(k) = w(k)-w(j)*AT(k,j);
        end
    end
    %回代法
    for j=n:-1:2
        w(j) = w(j)/AT(j,j);
        for k=1:j-1
            w(k) = w(k)-w(j)*AT(k,j);
        end
    end
    w(1) = w(1)/AT(1,1);
    
    %得到v
    v=sign(w);
    %计算z
    z=v;
    
    z = P*z;
    % 前代法
    for j=1:n-1
        z(j) = z(j)/1;
        for k=j+1:n
            z(k) = z(k)-z(j)*A(k,j);
        end
    end
    %回代法
    for j=n:-1:2
        z(j) = z(j)/A(j,j);
        for k=1:j-1
        z(k) = z(k)-z(j)*A(k,j);
        end
    end
    z(1) = z(1)/A(1,1);
    
    %判断
    temp = norm(z,'inf');
    if temp <= z'*x
        ans = norm(w,1);
        flag=0;
    else
        x(1:n,1)=0;
        for j=1:n
            if abs(z(j)) == temp
                x(j)=1;
                break
            end
        end
    end
end
%得到矩阵A的逆的无穷范数的估计(A的逆的转置的1范数)，存在ans里

kappa = norm(A,1)*ans;


    
    
    
    