function [H,P] = QR_double_itr(H)
% 双重步位移的QR迭代
% 输入：矩阵H
% 输出：矩阵H，H会收敛到一个上三角矩阵
%       矩阵P, P是Householder变换矩阵

n = length(H);
if n<=2
    return
end
m = n - 1;
s = H(m,m) + H(n,n);
t = H(m,m)*H(n,n) - H(m,n)*H(n,m);
x = H(1,1)*H(1,1)+H(1,2)*H(2,1)-s*H(1,1)+t;
y = H(2,1)*(H(1,1)+H(2,2)-s);
z = H(2,1)*H(3,2);
P = eye(n);

for k=0:n-3
    [v,beta] = house([x,y,z]');
    q = max(1,k);
    temp = eye(3)-beta*v*v';
    P = P*blkdiag(eye(k),temp,eye(n-3-k));
    H(k+1:k+3,q:n) = H(k+1:k+3,q:n) - (beta*v)*(v'*H(k+1:k+3,q:n));
    r = min(k+4,n);
    H(1:r,k+1:k+3) = H(1:r,k+1:k+3) - (H(1:r,k+1:k+3)*v)*(beta*v)';
    x = H(k+2,k+1);
    y = H(k+3,k+1);
    if k<n-3
        z = H(k+4,k+1);
    end
end

[v,beta] = house([x,y]');
temp = eye(2) - beta*v*v';
H(n-1:n,n-2:n) = H(n-1:n,n-2:n) - (beta*v)*(v'* H(n-1:n,n-2:n));
H(1:n,n-1:n) = H(1:n,n-1:n) - H(1:n,n-1:n)*v*(beta*v)';
P = P*(blkdiag(eye(n-2),temp));

end

