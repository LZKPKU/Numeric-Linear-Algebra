function [Lambda] = implicit_sym_QR(A)
% ��ʽ�Գ�QR�㷨��ʵ�Գƾ�����׷ֽ�
% ���룺ʵ�Գƾ���A
% ������Խ���Lambda
n = length(A);
% ���ԽǷֽ�
T = tri_diag(A);

% �������ж�
while(true)
u = 1e-300;
for i=1:n-1
    if abs(T(i+1,i))<=((abs(T(i,i))+abs(T(i+1,i+1))))*u
        T(i+1,i) = 0;
        T(i,i+1) = 0;
    end
end

m = n;
while(T(m,m-1) == 0)
    m = m - 1;
    if m == 1
        Lambda = T;
        return;
    end
end
k = m;
while(T(m,m-1)~=0)
    m = m-1;
    if m == 1
        break;
    end
end

%T(m:k,m:k) is T_{22}
T(m:k,m:k) = QR_Wilkinson_Shift(T(m:k,m:k));
end

end

