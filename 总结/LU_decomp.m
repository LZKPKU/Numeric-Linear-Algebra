function [A] = LU_decomp(A)
% Gauss��ȥ���������Ǿ���
% �����Ǿ���ĵ�LU�ֽ�
% �ϸ���������U���ϸ���������L
    [m,n] = size(A);
    if m~=n
        stop('�����������Ҫ��������');
    end
    for k = 1:n-1
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
    end
end