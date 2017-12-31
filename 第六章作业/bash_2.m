A = [2,3,4,5,6;4,4,5,6,7;0,3,6,7,8;0,0,2,8,9;0,0,0,1,10];
n = length(A);
% 上Hessenberg化
%H = Hessenberg(A);
H = A;
k = 0;
u=1e-15;
m = n;
while(m>2)
k = k + 1; 
% 收敛性判定
for i = 2:n
    if abs(H(i,i-1)) <= ((abs(H(i,i))+abs(H(i-1,i-1)))*u)
        H(i,i-1) = 0;
    end
end
H22_end = 0;
% determine m
for m = n:-1:2
    if H(m,m-1)~=0 
        H22_end = m;
        break;
    end
    % m = n,算法结束
    if m == 2
        return
    end
end

H22_begin = H22_end-1;
% determine H22
if H22_end~=2
    while(H(H22_begin,H22_begin-1)~=0)
        H22_begin = H22_begin - 1;
        if H22_begin == 1
            break;
        end
    end
end
% update these matrices
H(H22_begin:H22_end,H22_begin:H22_end) = ...
   QR_double_itr_new(H(H22_begin:H22_end,H22_begin:H22_end));

% 记录次对角线元素
for o = 1:4
res(k,o) = H(o+1,o);
end 
H
end

