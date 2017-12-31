function [T] = QR_Wilkinson_Shift(T)
% 带 Wilkinson位移的隐式对称QR迭代法
% 输入：三对角矩阵T(n by n)
% 输出：三对角矩阵T.
% 过程，进行了QR迭代的一步（加Wilikinson位移）
[m,n] = size(T);
d = (T(n-1,n-1)-T(n,n))/2;
mu = T(n,n)-T(n,n-1)^2/(d+sign(d)*sqrt(d^2+T(n,n-1)^2));
x = T(1,1)-mu;
z = T(2,1);

for k=1:n-1
    [c,s] = givens(x,z);
    G = eye(n);
    G(k,k) = c;G(k+1,k+1) = c;
    G(k,k+1) = -s;G(k+1,k) = s;
    T = G*T*G';
    if k<n-1
        x=T(k+1,k);z=T(k+2,k);
    end
end

end

