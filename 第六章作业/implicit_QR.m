function [H] = implicit_QR(A)
% ����ʵ�����ʵSchur�ֽ⣺��ʽQR�㷨
% ���룺ʵ����A
% �����Schur�ֽ��ľ���H
n = length(A);
% ��Hessenberg��
H = Hessenberg(A);

u=1e-64;
while(true)
    % �������ж�
    for i=1:n-1
        if abs(H(i+1,i))<=(abs(H(i,i))+abs(H(i+1,i+1)))*u
            H(i+1,i) = 0;
        end
    end
    H22_end = 0;
    % determine m
    for m = n:3
        if H(m,m-1)~=0 && H(m-1,m-2)~=0
            H22_end = m;
            break;
        end
        % m = n,�㷨����
        if m == 3
            return
        end
    end
    H22_begin = H22_end-2;
    % determine H22
    if H22_end~=3
        while(H(H22_begin,H22_begin-1)~=0)
            H22_begin = H22_begin - 1;
            if H22_begin == 1
                break;
            end
        end
    end
    % update these matrices
    [H(H22_begin:H22_end,H22_begin:H22_end),P] = ...
       QR_double_itr(H(H22_begin:H22_end,H22_begin:H22_end));
    % update H23
    if H22_end~=m
    H(H22_begin:H22_end,H22_end+1:n) = P'*H(H22_begin:H22_end,H22_end+1:n);
    end
    % update H12
    if H22_begin~=1
    H(1:H22_begin-1,H22_begin:H22_end) = H(1:H22_begin-1,H22_begin:H22_end)*P;
    end  
end


end


