function [x,k] = Jacobi(A,b,tol,Max_itnum)
% Jacobi ������
% ������ϵ������A������b�����̶� tol������������Max_itnum.
% ����ǽ�x�͵�������k

D = diag(diag(A));%A�ĶԽǲ���D
L = -tril(A,-1);%A�������ǲ��ֵ��෴��L
U = -triu(A,1);%A�������ǲ��ֵ��෴��U
Dinv = D^(-1);
B = Dinv*(L+U);%��������B
g = Dinv*b;
x0 = zeros(length(A),1);
x = B*x0+g;
k=1;
while norm(x-x0,2)>=tol
    x0 = x;
    x = B*x0+g;
    k = k+1;
    if k>= Max_itnum
        break;
    end
end
end

